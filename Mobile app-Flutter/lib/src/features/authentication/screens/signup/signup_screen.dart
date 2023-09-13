import 'package:ecg_auth_app_heartizm/src/common_widgets/form/form_header_widget.dart';
import 'package:ecg_auth_app_heartizm/src/constants/image_strings.dart';
import 'package:ecg_auth_app_heartizm/src/constants/text_strings.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/login_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/screens/signup/widgets/signup_footer_widget.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/screens/welcome/welcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/loading/loading_view.dart';
import '../../../../constants/sizes.dart';
import '../../../core/screens/profile/profile_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Get.find<LoginController>().isLoading.value ? const LoadingView()  : Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: SingleChildScrollView(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(defaultSize),
                    child: const Column(
                      children: [
                        FormHeaderWidget(
                          image: loginSignupImg,
                          title: signupTitle,
                          subTitle: signupSubTitle,
                        ),
                        SignUpFormWidget(),
                        SignUpFotterWidget(),
                      ],
                    ),
                  ),
                  // Get.find<LoginController>().isLoading.value
                  //     ? const Center(child: CircularProgressIndicator.adaptive(),)
                  //     : Container()
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
