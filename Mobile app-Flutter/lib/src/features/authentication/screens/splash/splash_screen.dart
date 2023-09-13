import 'package:ecg_auth_app_heartizm/src/constants/image_strings.dart';
import 'package:ecg_auth_app_heartizm/src/constants/sizes.dart';
import 'package:ecg_auth_app_heartizm/src/constants/text_strings.dart';
import 'package:ecg_auth_app_heartizm/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/fade_in_animation/animation_design.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_animation_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();
    var size = MediaQuery.of(context).size;
    // double height = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          FadeInAnimation(
            durationInMs: 1600,
            animate: AnimatePosition(
              topAfter: -50.0,
              topBefore: -100.0,
              leftAfter: -50.0,
              leftBefore: -100.0,
            ),
            child: Image(
              image: const AssetImage(splashPaintDrop),
              height: size.width / 2,
              width: size.width / 2,
            ),
          ),
          FadeInAnimation(
            durationInMs: 1600,
            animate: AnimatePosition(
              topBefore: 100.0,
              topAfter: 100.0,
              leftAfter: defaultSize,
              leftBefore: -80.0,
              bottomBefore: 0,
              bottomAfter: 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appName,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  appTagLine,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          FadeInAnimation(
            durationInMs: 2400,
            animate: AnimatePosition(bottomBefore: 0, bottomAfter: size.height /3,leftAfter: 0,leftBefore: 0,rightBefore: 0,rightAfter: 0),
            child: Image(
              image: const AssetImage(splashImage),
              height: size.height * 0.25,
              width: size.height * 0.25,
            ),
          ),
          FadeInAnimation(
            durationInMs: 2400,
            animate: AnimatePosition(
                bottomBefore: 0,
                bottomAfter: 40.0,
                rightAfter: defaultSize,
                rightBefore: defaultSize),
            child: Image(
              image: const AssetImage(splashPaintDropBottom),
              height: size.width / 11.0,
              width: size.width / 11.0,
            ),
          ),
        ],
      ),
    );
  }
}
