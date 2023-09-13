import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/login_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:ecg_auth_app_heartizm/src/features/core/controllers/profile_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/core/screens/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentication/controllers/otp_controller.dart';
import '../../features/authentication/screens/welcome/welcom_screen.dart';
import '../../repository/authentication_repository/authentication_repository.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

// fix white screen
  @override
  void onInit() {
    Get.lazyPut(() => AuthenticationRepository(), fenix: true);
    Get.lazyPut(() => OTPController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true); // TODO: implement onInit
    super.onInit();
  }

  //
  RxBool isAnimate = false.obs;





  RxBool userLoggedState = false.obs;


  Future startSplashAnimation() async {
    var prefs = await SharedPreferences.getInstance();
    var isFirstTime = prefs.getBool("firstTime") ?? true;

    Rx<bool?> successfulUser = prefs.getBool("success").obs;


    var themeValue = prefs.getString("theme") ?? "";

    if (themeValue == "") {
      var mode = PlatformDispatcher.instance.platformBrightness;
      if (mode == Brightness.dark) {
        prefs.setString("theme", "dark");
      } else {
        prefs.setString("theme", "light");
      }
    } else {
      if (themeValue == "dark") {
        Get.find<LoginController>().theme.value = "dark";
        Get.find<LoginController>().update();
        Get.changeThemeMode(ThemeMode.dark);
      } else {
        Get.find<LoginController>().theme.value = "light";
        Get.find<LoginController>().update();
        Get.changeThemeMode(ThemeMode.light);
      }
    }
    //make the compiler wait 0.5 second before compile the next line to make the animation work
    await Future.delayed(const Duration(milliseconds: 1000));
    isAnimate.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));
    isAnimate.value = false;
    await Future.delayed(const Duration(milliseconds: 2000));
    if (isFirstTime) {
      prefs.setBool("firstTime", false);
      Get.offAll(() => const OnBoardingScreen());
    } else {
      if (FirebaseAuth.instance.currentUser != null &&
          successfulUser.value == true) {

        Get.offAll(() =>  const ProfileScreen());

      } else if (FirebaseAuth.instance.currentUser == null ||
          successfulUser.value == false) {

        Get.offAll(() => const WelcomeScreen());
      }
    }
  }

  Future startAnimation() async {
    //make the compiler wait 0.5 second before compile the next line to make the animation work
    await Future.delayed(const Duration(milliseconds: 700));
    isAnimate.value = true;
  }
}
