import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/sizes.dart';
import '../../controllers/login_controller.dart';
import '../../models/model_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(defaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(
              model.image,
            ),
            height: size.height * 0.4,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 30.0, fontWeight: FontWeight.bold,
                  color: Colors.black,

                ),
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Text(
            model.counterText,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color:Colors.black),

          ),
          const SizedBox(
            height: 80.0,
          )
        ],
      ),
    );
  }
}
