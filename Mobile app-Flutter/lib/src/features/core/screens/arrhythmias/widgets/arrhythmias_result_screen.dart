import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../authentication/controllers/login_controller.dart';

class ArrhythmiasResult extends StatelessWidget {
  const ArrhythmiasResult({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detection Result',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Get.find<LoginController>()
                          .lastECG
                          .value
                          .resultClassification,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Average Heart Rate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Get.find<LoginController>()
                          .lastECG
                          .value
                          .averageHeartRate.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detection Date',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Get.find<LoginController>()
                          .lastECG
                          .value
                          .startTime.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              const Row(
                children: [
                  Text(
                    'What is AFib?',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const Text(
               "Atrial fibrillation is an irregular heart rhythm and occurs when the upper chambers beat out of sync with the lower chambers. This can increase risk of blood clots, stroke and heart attack. Adults over 40 have a 1 in 4 risk of developing AFib in their lifetime.** AFib is treatable, so the earlier you identify it, the sooner you can do something about it.",



                style: TextStyle(
                  fontSize: 15.0,
                ),
                textAlign: TextAlign.start,
              ),
             
            ],
          )
      ),
    );
  }
}
