import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecg_auth_app_heartizm/firebase_options.dart';
import 'package:ecg_auth_app_heartizm/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/login_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/otp_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/screens/splash/splash_screen.dart';
import 'package:ecg_auth_app_heartizm/src/features/core/controllers/profile_controller.dart';
import 'package:ecg_auth_app_heartizm/src/repository/authentication_repository/authentication_repository.dart';
import 'package:ecg_auth_app_heartizm/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value)  {

    Get.lazyPut(() => AuthenticationRepository(), fenix: true);
    Get.lazyPut(() => OTPController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
  });

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Heartizm',
      themeMode: ThemeMode.system,
      theme: HAppTheme.lightTheme,
      darkTheme: HAppTheme.darkTheme,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: const SplashScreen(),
    );
  }
}

// const Scaffold(body: Center(child: CircularProgressIndicator()))