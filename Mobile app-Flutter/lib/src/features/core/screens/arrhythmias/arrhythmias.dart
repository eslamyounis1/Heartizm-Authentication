import 'package:ecg_auth_app_heartizm/src/constants/image_strings.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/login_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/core/screens/arrhythmias/widgets/arrhythmias_detect_wait_screen.dart';
import 'package:ecg_auth_app_heartizm/src/features/core/screens/arrhythmias/widgets/arrhythmias_result_screen.dart';
import 'package:ecg_auth_app_heartizm/src/features/core/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/loading/loading_view.dart';
import '../../../../constants/text_strings.dart';

class ArrhythmiasScreen extends StatelessWidget {
  const ArrhythmiasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Get.find<LoginController>().isLoading.value ? const LoadingView(): Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Get.find<LoginController>().theme.value == "dark"
                    ? Colors.white
                    : Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            title: Text(
              "Result",
              style: TextStyle(
                  color: Get.find<LoginController>().theme.value == "dark"
                      ? Colors.white
                      : Colors.black),
            ),
            automaticallyImplyLeading: true,
          ),
          body: Stack(
            // alignment: AlignmentDirectional.topStart,

            children: [
              Get.find<LoginController>()
                          .lastECG
                          .value
                          .numberOfWaveformSamples ==
                      0
                  ? const ArrhythmiasDetectWaitPage()
                  : const ArrhythmiasResult(),
              // Get.find<LoginController>().isLoading.value
              //     ? const LoadingView()
              //     : Container()
            ],
          ),
        );
      },
    );
  }
}
// // Column(
// // mainAxisAlignment: MainAxisAlignment.center,
// // children: [
// // const Image(
// // image: AssetImage(fitbitImg),
// // width: 100.0,
// // height: 100.0,
// // ),
// // const CircularProgressIndicator.adaptive(
// // backgroundColor: Colors.transparent,
// // ),
// // Text(
// // loadingMainTxt,
// // style: Theme.of(context).textTheme.bodyLarge,
// // textAlign: TextAlign.center,
// // ),
// // const Text(
// // loadingSubTxt,
// // textAlign: TextAlign.center,
// // ),
// // ],
// // )



// Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const SizedBox(
// height: 10,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const Text(
// 'Result:',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 20.0),
// ),
// const SizedBox(
// width: 10,
// ),
// Text(
// Get.find<LoginController>()
//     .lastECG
//     .value
//     .resultClassification,
// style: TextStyle(
// // fontWeight: FontWeight.bold,
// fontSize: 20.0),
// ),
// ],
// ),
// const SizedBox(
// height: 20,
// ),
// Text(
// "Average Heart rate : ${Get.find<LoginController>().lastECG.value.averageHeartRate}"),
// const SizedBox(
// height: 20,
// ),
// Text(
// "Start time : ${Get.find<LoginController>().lastECG.value.startTime}"),
// const SizedBox(
// height: 20,
// ),
// /* Expanded(
//                   child: SizedBox(
//                     height: 500,
//                     child: ListView.separated(
//                       scrollDirection: Axis.vertical,
//                       itemCount: reading.waveformSamples.length,
//                       separatorBuilder: (BuildContext context, int index) =>
//                           const Divider(),
//                       itemBuilder: (BuildContext context, int index) {
//                         return ListTile(
//                           title: Text(
//                             '${reading.waveformSamples.elementAt(index)}',
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ), */
// ],
// ),
// )