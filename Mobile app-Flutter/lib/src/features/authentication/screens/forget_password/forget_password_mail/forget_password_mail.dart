import 'package:ecg_auth_app_heartizm/src/constants/sizes.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';
import '../forget_password_otp/otp_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              children: [
                const SizedBox(
                  height: defaultSize * 4,
                ),
                const FormHeaderWidget(
                  imageHeight: 0.25,
                  image: forgetPasswordImg,
                  title: hForgetPassword,
                  subTitle: forgetMailSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: formHeight,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text(hEmail),
                          hintText: hEmail,
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => const OTPScreen(
                                      user: UserModel(
                                          email: "",
                                          password: "",
                                          fullName: fullName,
                                          phoneNo: phoneNo),
                                      verificationId: '',
                                    ));
                              },
                              child: Text(hNext.toUpperCase()))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
