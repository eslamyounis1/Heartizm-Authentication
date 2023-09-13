import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecg_auth_app_heartizm/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/login_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/models/ecg.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/models/user_model.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/screens/welcome/welcom_screen.dart';
import 'package:ecg_auth_app_heartizm/src/repository/authentication_repository/exceptions/login_email_password_failure.dart';
import 'package:ecg_auth_app_heartizm/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/core/controllers/profile_controller.dart';
import '../../features/core/screens/profile/profile_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _sitInitialScreen);
  }

  //check if the user logged on or logged out
  _sitInitialScreen(User? user) async {
    var prefs = await SharedPreferences.getInstance();
    Rx<bool?> successfulUser = prefs.getBool("success").obs;
    if (user == null) {
      Get.offAll(() => const WelcomeScreen());
    }
  }

  //FUNC
  Future<void> phoneAuthentication(UserModel user) async {
    //await _auth.setSettings(appVerificationDisabledForTesting: false);

    await _auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 30),
      phoneNumber: user.phoneNo,
      verificationCompleted: (credential) async {
        log("Verification Completed!!!");
      },
      codeSent: (verificationId, resendToken) {
        Get.find<LoginController>().isLoading.value = false;
        Get.find<LoginController>().update();
        this.verificationId.value = verificationId;
        Get.to(() => OTPScreen(
              user: user,
              verificationId: verificationId,
            ));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        log(e.toString());
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is not valid.');
        } else {
          Get.snackbar('Error', 'Something went wrong. Try again.');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp, String verificationId) async {
    try {
      var credentials = await _auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: otp));
      return credentials.user != null ? true : false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (firebaseUser.value != null) {
        Get.offAll(() => const ProfileScreen());
      } else {
        Get.off(() => const WelcomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      log('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      log('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    var prefs = await SharedPreferences.getInstance();
    try {
      EcgReading ecg = await Get.find<LoginController>().getLastECG();
      if (ecg.waveformSamples.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        var user = await FirebaseFirestore.instance
            .collection("Users")
            .where("Email", isEqualTo: email)
            .get();
        Get.find<LoginController>().user.value = UserModel(
            email: email,
            password: password,
            fullName: user.docs.first.data()["FullName"],
            phoneNo: user.docs.first.data()["Phone"]);
        Get.find<LoginController>().update();

        var success = await Get.find<LoginController>().loginWithECG(
            UserModel(
                email: email,
                password: password,
                fullName: user.docs.first.data()["FullName"],
                phoneNo: user.docs.first.data()["Phone"]),
            ecg.waveformSamples);

        if (success && firebaseUser.value != null) {
          var userFullName = user.docs.first.data()["FullName"];
          var userEmail = email;
          // Get.find<ProfileController>().fullName = userFullName;
          // Get.find<ProfileController>().userEmail = userEmail;

          Get.find<LoginController>().isLoading.value = false;
          Get.find<LoginController>().update();
          prefs.setBool("success", true);

          Get.offAll(() => const ProfileScreen());
        } else {
          Get.find<LoginController>().isLoading.value = false;
          Get.find<LoginController>().update();
          prefs.setBool("success", false);
          Get.to(() => const WelcomeScreen());
        }
      }
    } on FirebaseAuthException catch (e) {
      final ex = LoginWithEmailAndPasswordFailure.code(e.code);
      log('FIREBASE AUTH EXCEPTION - ${ex.message}');
      Get.snackbar('Error', ex.message);
      throw ex;
    } catch (_) {
      const ex = LoginWithEmailAndPasswordFailure();
      log('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
