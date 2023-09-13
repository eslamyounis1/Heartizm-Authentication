import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:ecg_auth_app_heartizm/src/constants/contants.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/models/ecg.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/models/ecgauth.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/models/user_model.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/screens/welcome/welcom_screen.dart';
import 'package:ecg_auth_app_heartizm/src/features/core/screens/profile/profile_screen.dart';
import 'package:ecg_auth_app_heartizm/src/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  RxBool isObscure = true.obs;
void changeVisibility (){
  isObscure.value = !isObscure.value;
}
  var isLoading = false.obs;
  var lastECG = Constants.emptyECG.obs;
  var allECG = <EcgReading>[].obs;
  var theme = "".obs;
  var user =
      const UserModel(email: "", password: "", fullName: "", phoneNo: "").obs;

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  late final User firebaseUser;


  String uEmail = '';
  String uName = '';


  //call this Function from Design & it will do the rest
  Future<void> userLogin(String email, String password) async {
    AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
  }

  Future<bool> loginWithECG(UserModel user, List<int> waves) async {
    Get
        .find<LoginController>()
        .isLoading
        .value = true;
    Get.find<LoginController>().update();
    final url2 = Uri.parse("https://200e-154-190-220-131.ngrok.io/auth/login");

    Map<String, dynamic> body = {
      "UserName": user.fullName,
      "PhoneNumber": user.phoneNo,
      "csv": waves
    };
    final headers = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    };
    var response2 =
    await http.post(url2, body: jsonEncode(body), headers: headers);
    log(response2.body);

    if (response2
        .body.isNotEmpty /* && response2.body.contains("Authenticated") */) {
      Ecgauth ea = ecgauthFromJson(response2.body);
      if (ea.result == "Authenticate") {
        Get
            .find<LoginController>()
            .isLoading
            .value = false;
        Get.find<LoginController>().update();
        return true;
      } else if (ea.result == "Not Authenticate") {
        Get.snackbar("Error", "ECG not authenticated");
        Get
            .find<LoginController>()
            .isLoading
            .value = false;
        Get.find<LoginController>().update();

        return false;
      } else {
        Get.snackbar("Error", "user not exist");
      }
    }
    Get
        .find<LoginController>()
        .isLoading
        .value = false;
    Get.find<LoginController>().update();
    return false;
  }

  // Future<bool> successLogin()async{
  //   var prefs = await SharedPreferences.getInstance();
  //   prefs.setBool("success", true);
  //   prefs.getString('Name');
  //   prefs.getString('Email');
  //   userLogged.value = true;
  //   return true;
  //
  // }

  Future<void> clearLastECG() {
    lastECG.value = Constants.emptyECG;
    update();
    return Future.value();
  }

  Future<EcgReading> getLastECG() async {
    {
      try {
        final result = await FlutterWebAuth2.authenticate(
            url:
            "https://www.fitbit.com/oauth2/authorize?response_type=token&client_id=23QYM2&redirect_uri=example://fitbit/auth&expires_in=604800%20&scope=electrocardiogram",
            callbackUrlScheme: "example");
        Get
            .find<LoginController>()
            .isLoading
            .value = true;
        Get.find<LoginController>().update();
        final userId =
        result
            .split("#")
            .last
            .split("&")
            .elementAt(1)
            .substring(8);
        final accessToken =
        result
            .split("#")
            .last
            .split("&")
            .first
            .substring(13);
        String before = DateFormat("yyyy-MM-dd")
            .format(DateTime.now().add(const Duration(days: 1)));

        final url = Uri.parse(
            'https://api.fitbit.com/1/user/$userId/ecg/list.json?beforeDate=$before&sort=desc&limit=1&offset=0');
        var response = await http.get(url, headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $accessToken",
        });
        Ecg e = Ecg.fromJson(jsonDecode(response.body));
        lastECG.value = e.ecgReadings.first;
        update();
        Get
            .find<LoginController>()
            .isLoading
            .value = false;
        Get.find<LoginController>().update();
        return e.ecgReadings.first;
      } catch (e) {
        log(e.toString());
        Get
            .find<LoginController>()
            .isLoading
            .value = false;
        Get.find<LoginController>().update();
        return Constants.emptyECG;
      }
    }
  }

  Future<List<EcgReading>> getLastFiveECG() async {
    {
      final result = await FlutterWebAuth2.authenticate(
          url:
          "https://www.fitbit.com/oauth2/authorize?response_type=token&client_id=23QYM2&redirect_uri=example://fitbit/auth&expires_in=604800%20&scope=electrocardiogram&prompt=login",
          callbackUrlScheme: "example");
      Get
          .find<LoginController>()
          .isLoading
          .value = true;
      Get.find<LoginController>().update();
      final userId =
      result
          .split("#")
          .last
          .split("&")
          .elementAt(1)
          .substring(8);
      final accessToken = result
          .split("#")
          .last
          .split("&")
          .first
          .substring(13);

      String before = DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(const Duration(days: 1)));

      final url = Uri.parse(
          'https://api.fitbit.com/1/user/$userId/ecg/list.json?beforeDate=$before&sort=desc&limit=5&offset=0');
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $accessToken",
      });

      try {
        Ecg e = ecgFromJson(response.body);
        Get
            .find<LoginController>()
            .isLoading
            .value = false;
        Get.find<LoginController>().update();
        return e.ecgReadings;
      } catch (e) {
        log(e.toString());
        Get
            .find<LoginController>()
            .isLoading
            .value = false;
        Get.find<LoginController>().update();
        return [];
      }
    }
  }

  Future<List<EcgReading>> getAllECG() async {
    {
      final result = await FlutterWebAuth2.authenticate(
          url:
          "https://www.fitbit.com/oauth2/authorize?response_type=token&client_id=23QYM2&redirect_uri=example://fitbit/auth&expires_in=604800%20&scope=electrocardiogram",
          callbackUrlScheme: "example");
      Get
          .find<LoginController>()
          .isLoading
          .value = true;
      Get.find<LoginController>().update();
      final userId =
      result
          .split("#")
          .last
          .split("&")
          .elementAt(1)
          .substring(8);
      final accessToken = result
          .split("#")
          .last
          .split("&")
          .first
          .substring(13);

      String before = DateFormat("yyyy-MM-dd")
          .format(DateTime.now().add(const Duration(days: 1)));

      final url = Uri.parse(
          'https://api.fitbit.com/1/user/$userId/ecg/list.json?beforeDate=$before&sort=desc&limit=10&offset=0');
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $accessToken",
      });
      log(response.body);
      try {
        Ecg e = ecgFromJson(response.body);
        allECG.value = e.ecgReadings;
        update();
        Get
            .find<LoginController>()
            .isLoading
            .value = false;
        Get.find<LoginController>().update();
        return e.ecgReadings;
      } catch (e) {
        log(e.toString());
        Get
            .find<LoginController>()
            .isLoading
            .value = false;
        Get.find<LoginController>().update();
        return [];
      }
    }
  }
/*   // Get phoneNo from user and pass it to Auth Repository for Firebase Authentication
  void phoneAuthentication(UserModel user) {
    AuthenticationRepository.instance.phoneAuthentication(user);
  } */
}
