import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common_widgets/loading/loading_view.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
        (){
        return Get.find<LoginController>().isLoading.value ? const LoadingView() :Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              // title: const Text("History"),
              automaticallyImplyLeading: true,
              leading: IconButton(icon: Icon(Icons.arrow_back_ios),color:Get.find<LoginController>().theme.value == "dark"
                  ? Colors.white
                  : Colors.black, onPressed: (){
                Navigator.pop(context);
              },),
            ),
            body: Obx(() {
              return Center(
                child: Get.find<LoginController>().allECG.isEmpty
                    ? const Text("Loading...")
                    : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: Get.find<LoginController>().allECG.length,
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                    color: Colors.black,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(Get.find<LoginController>()
                              .allECG
                              .elementAt(index)
                              .resultClassification),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                              "Average Heart rate : ${Get.find<LoginController>().allECG.elementAt(index).averageHeartRate}"),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                              "Start time : ${DateFormat.yMMMMd().format(Get.find<LoginController>().allECG.elementAt(index).startTime)}"),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
          );
        }
    );
  }
}
