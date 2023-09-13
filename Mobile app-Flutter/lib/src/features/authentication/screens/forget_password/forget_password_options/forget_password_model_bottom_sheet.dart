import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../forget_password_mail/forget_password_mail.dart';
import '../forget_password_phone/forget_password_phone.dart';
import 'forget_password_btn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              forgetPasswordTitle,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Text(
              forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 30.0,
            ),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
              title: hEmail,
              subTitle: resetViaEmail,
              btnIcon: Icons.mail_outline_rounded,
            ),
            const SizedBox(
              height: 20.0,
            ),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordPhoneScreen());
              },
              title: phoneNo,
              subTitle: resetViaPhone,
              btnIcon: Icons.mobile_friendly_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
