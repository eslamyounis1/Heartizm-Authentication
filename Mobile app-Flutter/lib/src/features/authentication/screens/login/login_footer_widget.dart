import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../signup/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('OR'),
        const SizedBox(
          height: formHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(googleLogoImg),
              width: 20.0,
            ),
            onPressed: () {},
            label: const Text(hSignInWithGoogle),
          ),
        ),
        const SizedBox(
          height: formHeight - 20,
        ),
        TextButton(
          onPressed: () {
            Get.to(() => const SignUpScreen());
          },
          child: Text.rich(
            TextSpan(
              text: dontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
              children: const [
                TextSpan(
                  text: signup,
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
