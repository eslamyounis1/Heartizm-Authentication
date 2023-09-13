import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/login_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/core/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: hEmail,
                  hintText: hEmail,
                  border: OutlineInputBorder()),
              validator: (value){
                if(value!.isEmpty || !RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9]?)(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                  return "Enter correct email address";
                }else{
                  return null;
                }
              },
            ),
            const SizedBox(height: formHeight - 20),
            Obx(
                () => TextFormField(
                obscureText: Get.find<LoginController>().isObscure.value,
                controller: controller.password,
                decoration:  InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  labelText: hPassword,
                  hintText: hPassword,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: (){
                    // Get.find<LoginController>().isObscure.value = !Get.find<LoginController>().isObscure.value;
                    Get.find<LoginController>().changeVisibility();
                  },icon: Get.find<LoginController>().isObscure.value == true ?  const Icon(Icons.remove_red_eye_sharp) : const Icon(Icons.visibility_off)),
                ),
                  validator: (value){
                    if(value!.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                      String passCriteria = "choose strong password:\n At least one uppercase letter\n At least one lowercase letter\n At least one special character'!@#\$&*~'\n password must be at least 8 characters";
                      return passCriteria;
                    }else{
                      return null;
                    }
                  },

                ),
            ),
            const SizedBox(height: formHeight - 20),
            // -- FORGET PASSWORD BTN
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text(forgetPassword),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async{
                  if (formKey.currentState!.validate()) {
                    Get.find<LoginController>().isLoading.value = true;
                    Get.find<LoginController>().update();
                   await LoginController.instance.userLogin(
                        controller.email.text.trim(),
                        controller.password.text.trim());


                  }
                },
                child: Text(
                  login.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
