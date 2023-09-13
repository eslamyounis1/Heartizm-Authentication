import 'package:ecg_auth_app_heartizm/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:ecg_auth_app_heartizm/src/constants/sizes.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/login_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/screens/login/login_header_widget.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/screens/welcome/welcom_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/loading/loading_view.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../../../core/screens/profile/profile_screen.dart';
import 'login_footer_widget.dart';
import 'login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Obx(() {

        return  Get.find<LoginController>().isLoading.value ? const LoadingView() : Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: SingleChildScrollView(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [

                  Container(
                    padding: const EdgeInsets.all(defaultSize - 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LoginHeaderWidget(size: size),
                        const LoginForm(),
                        const LoginFooterWidget(),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}


