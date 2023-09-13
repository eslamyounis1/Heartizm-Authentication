import 'package:ecg_auth_app_heartizm/src/constants/sizes.dart';
import 'package:ecg_auth_app_heartizm/src/constants/text_strings.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/login_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/models/user_model.dart';
import 'package:ecg_auth_app_heartizm/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen(
      {super.key, required this.user, required this.verificationId});
  final UserModel user;
  final String verificationId;

  @override
  Widget build(BuildContext context) {
    //var otpController = Get.put(OTPController());
    String otp = "";
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  otpTitle,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 80.0,
                  ),
                ),
                Text(otpSubTitle.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 15.0)),
                const SizedBox(height: 40.0),
                Text(
                  "$otpMessage ${user.phoneNo}",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Obx(() {
                  return OtpTextField(
                    numberOfFields: 6,
                    fillColor:
                        Get.find<LoginController>().theme.value == "light"
                            ? Colors.black.withOpacity(0.1)
                            : Colors.white.withOpacity(0.1),
                    filled: true,
                    onSubmit: (code) async {
                      otp = code;
                      var isVerified = await AuthenticationRepository.instance
                          .verifyOTP(otp, verificationId);
                      if (isVerified) {
                        await AuthenticationRepository.instance
                            .createUserWithEmailAndPassword(
                                user.email, user.password);
                      } else {
                        Get.back();
                      }
                    },
                  );
                }),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      //OTPController.instance.verifyOTP(otp);
                    },
                    child: Text(hNext.toUpperCase()),
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
