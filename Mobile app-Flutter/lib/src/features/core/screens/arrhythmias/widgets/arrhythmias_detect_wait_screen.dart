import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../authentication/controllers/login_controller.dart';

class ArrhythmiasDetectWaitPage extends StatelessWidget {
  const ArrhythmiasDetectWaitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                child: const Image(
                    image: AssetImage(arrhythmiasImg)),
              ),
            ],

          ),
          const Row(
            children: [
              Text(
                'What is Arrhythmias?',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const Text(
            'An arrhythmia is a problem with the rate or rhythm of your heartbeat. It means that your heart beats too quickly, too slowly, or with an irregular pattern. When the heart beats faster than normal, it is called tachycardia. When the heart beats too slowly, it is called bradycardia. The most common type of arrhythmia is atrial fibrillation, which causes an irregular and fast heart beat.',
            style: TextStyle(
              fontSize: 15.0,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  try {
                    await Get.find<LoginController>()
                        .getLastECG();
                  } catch (e) {
                    Get.snackbar("Error", e.toString());
                  }
                },
                // style: ElevatedButton.styleFrom(
                //   shape: const StadiumBorder(),
                // ),
                child: const Text("Detect")),
          ),
        ],
      ),
    );
  }
}
