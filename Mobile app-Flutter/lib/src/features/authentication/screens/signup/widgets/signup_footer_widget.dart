import 'package:ecg_auth_app_heartizm/src/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFotterWidget extends StatelessWidget {
  const SignUpFotterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('OR'),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(googleLogoImg),
              width: 20.0,
            ),
            label: Text(hSignInWithGoogle.toUpperCase()),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.to(() => const LoginScreen());
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: alreadyHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge),
            TextSpan(text: login.toUpperCase()),
          ])),
        ),
      ],
    );
  }
}
