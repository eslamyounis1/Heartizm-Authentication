import 'package:ecg_auth_app_heartizm/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:ecg_auth_app_heartizm/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:ecg_auth_app_heartizm/src/constants/colors.dart';
import 'package:ecg_auth_app_heartizm/src/constants/image_strings.dart';
import 'package:ecg_auth_app_heartizm/src/constants/sizes.dart';
import 'package:ecg_auth_app_heartizm/src/constants/text_strings.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/login_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/screens/login/login_screen.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../common_widgets/loading/loading_view.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    //var brightness = mediaQuery.platformBrightness;
    var height = mediaQuery.size.height;

    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();
    return Obx(
      () {
        return Scaffold(
          backgroundColor: Get.find<LoginController>().theme.value == "dark" || MediaQuery.of(context).platformBrightness == Brightness.dark
              ? darkColor
              : primaryColor,
          body: Stack(
            children: [
              FadeInAnimation(
                durationInMs: 1200,
                animate: AnimatePosition(
                    bottomAfter: 0,
                    bottomBefore: -100.0,
                    leftBefore: 0,
                    leftAfter: 0,
                    topAfter: 0,
                    topBefore: 0,
                    rightBefore: 0,
                    rightAfter: 0),
                child: Container(
                  padding: const EdgeInsets.all(defaultSize),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                        image: const AssetImage(
                          welcomeScreenImg,
                        ),
                        height: height * 0.6,
                      ),
                      Column(
                        children: [
                          Text(
                            welcomeTitle,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32.0),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            welcomeSubTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () async {
                                /*  var p = await SharedPreferences.getInstance();
                                p.remove("firstTime"); */

                                Get.to(() => const LoginScreen());
                              },
                              child: Text(login.toUpperCase()),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => const SignUpScreen());
                                // Get.to(() => const SelectWatchScreen());
                              },
                              child: Text(signup.toUpperCase()),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Get.find<LoginController>().isLoading.value
                  ? const LoadingView()
                  : Container()
            ],
          ),
        );
      },
    );
  }
}
