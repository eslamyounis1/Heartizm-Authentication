import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();
  /* void verifyOTP(String otp,String verificationId) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const ProfileScreen()) : Get.back();
  } */
}
