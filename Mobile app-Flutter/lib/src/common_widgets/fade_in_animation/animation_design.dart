import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'fade_in_animation_controller.dart';
import 'fade_in_animation_model.dart';

class FadeInAnimation extends StatelessWidget {
  FadeInAnimation(
      {super.key,
      this.height,
      this.width,
      required this.durationInMs,
      required this.animate,
      required this.child});

  final controller = Get.put(FadeInAnimationController());
  final double? height;
  final double? width;
  final int durationInMs;
  final AnimatePosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: durationInMs),
        top:
            controller.isAnimate.value ? animate!.topAfter : animate!.topBefore,
        left: controller.isAnimate.value
            ? animate!.leftAfter
            : animate!.leftBefore,
        bottom: controller.isAnimate.value
            ? animate!.bottomAfter
            : animate!.bottomBefore,
        right: controller.isAnimate.value
            ? animate!.rightAfter
            : animate!.rightBefore,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: durationInMs),
          opacity: controller.isAnimate.value ? 1 : 0,
          child: child,
          // child: Image(
          //   image: const AssetImage(splashPaintDrop),
          //   height: height / 2,
          //   width: width / 2,
          // ),
        ),
      ),
    );
  }
}
