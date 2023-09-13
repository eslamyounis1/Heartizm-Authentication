import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecg_auth_app_heartizm/src/repository/authentication_repository/authentication_repository.dart';
import 'package:ecg_auth_app_heartizm/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../authentication/controllers/login_controller.dart';
import '../../authentication/models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  @override
  void onInit() {

    Get.lazyPut(() => LoginController(), fenix: true); // TODO: implement onInit
    super.onInit();
  }


  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
     return _userRepo.getUserDetails(email);
    }else{
      Get.snackbar('Error', "Login to continue");
    }
  }
}
