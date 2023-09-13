import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controllers/login_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obController.pages,
            liquidController: obController.controller,
            onPageChangeCallback: obController.onPageChangedCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () => obController.animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration:  const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
              ),
            ),
          ),
          Positioned(
            top: 50.0,
            right: 20.0,
            child: TextButton(
              onPressed: () => obController.skip(),
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 20.0,
              child: AnimatedSmoothIndicator(
                count: 3,
                activeIndex: obController.currentPage.value,
                effect: const WormEffect(
                    activeDotColor: Color(0xff272727), dotHeight: 15.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
