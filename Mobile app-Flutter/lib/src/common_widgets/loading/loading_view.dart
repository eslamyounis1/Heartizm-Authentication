import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/image_strings.dart';
import '../../constants/text_strings.dart';
import '../../features/authentication/controllers/login_controller.dart';
import '../../features/authentication/screens/welcome/welcom_screen.dart';

class LoadingView extends StatefulWidget  {
  const LoadingView({
    super.key,
  });

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const WelcomeScreen());
            },
            icon:  Icon(Icons.close,color: Get.find<LoginController>().theme.value == "dark" || MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Colors.white
                : Colors.black,),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(fitbitImg),
            width: 100.0,
            height: 100.0,
          ),
          const SizedBox(height: 5.0),
          const CircularProgressIndicator.adaptive(
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(height: 10.0),
          Text(
            loadingMainTxt,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5.0),
          const Text(
            loadingSubTxt,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}