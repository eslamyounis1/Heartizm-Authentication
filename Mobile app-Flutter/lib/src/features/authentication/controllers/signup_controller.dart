import 'dart:convert';
import 'dart:developer';

import 'package:ecg_auth_app_heartizm/src/constants/image_strings.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/login_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/models/ecg.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/models/user_model.dart';
import 'package:ecg_auth_app_heartizm/src/repository/authentication_repository/authentication_repository.dart';
import 'package:ecg_auth_app_heartizm/src/repository/user_repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../constants/text_strings.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // form validation
  RxString userPassword = ''.obs;
  RxBool isPasswordValid = true.obs;

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRep = Get.put(UserRepository());

  //call this Function from Design & it will do the rest
/*   void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  } */
  RxBool isObscure = true.obs;
  void changeVisibility (){
    isObscure.value = !isObscure.value;
  }
  Future<bool> signUpWithECG(UserModel user, List<EcgReading> ecg) async {
    Get
        .find<LoginController>()
        .isLoading
        .value = true;
    Get.find<LoginController>().update();
    List<int> appended = [];
    for (var element in ecg) {
      appended.addAll(element.waveformSamples);
    }

    bool success = await newUser(user);
    if (success) {
      bool x = await store(appended);
      Get
          .find<LoginController>()
          .isLoading
          .value = false;
      Get.find<LoginController>().update();
      return x;
    }
    Get
        .find<LoginController>()
        .isLoading
        .value = false;
    Get.find<LoginController>().update();
    return false;
  }

  Future<bool> newUser(UserModel user) async {
    final url2 = Uri.parse("https://200e-154-190-220-131.ngrok.io/auth/new_user");

    Map<String, String> body = {
      "UserName": user.fullName,
      "PhoneNumber": user.phoneNo,
      "Email": user.email
    };
    final headers = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    };
    var response2 =
    await http.post(url2, body: jsonEncode(body), headers: headers);

    if (response2.body.isNotEmpty && !response2.body.contains("error")) {
      log(response2.body);
      return true;
    }
    return false;
  }

  Future<bool> store(List<int> waves) async {
    final url2 = Uri.parse("https://200e-154-190-220-131.ngrok.io/auth/new_user");


    Map<String, List<int>> body = {
      "csv": waves,
    };
    final headers = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    };

    var response2 =
    await http.post(url2, body: jsonEncode(body), headers: headers);

    if (response2.body.isNotEmpty) {
      log("store///////////");
      log(response2.body);
      return true;
    }
    return false;
  }

  // Get phoneNo from user and pass it to Auth Repository for Firebase Authentication
  Future<void> createUser(UserModel user) async {
    var ecgsList = await Get.find<LoginController>().getLastFiveECG();
    var fitbitUp = await signUpWithECG(user, ecgsList);
    if (fitbitUp) {
      Get
          .find<LoginController>()
          .isLoading
          .value = true;
      Get.find<LoginController>().update();
      var success = await userRep.createUser(user);
      if (success) {
        await AuthenticationRepository.instance.phoneAuthentication(user);
      }
    }
  }
}
