import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/signup_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: formHeight - 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                label: Text(fullName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              validator: (value){

                if(value!.isEmpty || !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)){
                  return "Enter correct Name";
                }else{
                  return null;
                }
              },
            ),
            const SizedBox(
              height: formHeight - 20,
            ),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                label: Text(hEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              validator: (value){
                if(value!.isEmpty || !RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9]?)(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                  return "Enter correct email address";
                }else{
                  return null;
                }
              },
            ),
            const SizedBox(
              height: formHeight - 20,
            ),
            IntlPhoneField(
              initialCountryCode: 'QA',
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                label: Text(phoneNo),
                hintText: '339-6086',
                prefixIcon: Icon(Icons.numbers),

              ),

            ),
            const SizedBox(
              height: formHeight - 20,
            ),
            Obx(
              ()=> TextFormField(
                obscureText: Get.find<SignUpController>().isObscure.value,
                controller: controller.password,
                decoration:  InputDecoration(
                  label: const Text(hPassword),
                  prefixIcon: const Icon(Icons.fingerprint),
                  suffixIcon: IconButton(onPressed: (){
                    // Get.find<LoginController>().isObscure.value = !Get.find<LoginController>().isObscure.value;
                    Get.find<SignUpController>().changeVisibility();
                  },icon: Get.find<SignUpController>().isObscure.value == true ?  const Icon(Icons.remove_red_eye_sharp) : const Icon(Icons.visibility_off)),

                ),

                // -TODO still working on remove the validation message when user enter it correctly live change
                onChanged: (value){
                  Get.find<SignUpController>().userPassword.value = value;
                  Get.find<SignUpController>().isPasswordValid.value = true;
                },
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please choose a password';
                  }
                  if(value.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                    String passCriteria = "choose strong password:\n At least one uppercase letter\n At least one lowercase letter\n At least one special character'!@#\$&*~'\n password must be at least 8 characters";
                    Get.find<SignUpController>().isPasswordValid.value = false;
                    return passCriteria;
                  }else{
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(
              height: formHeight - 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {

                    /*
                    =================
                    TODO: Step - 3 [Get User and Pass it to Controller]
                    =================
                     */
                    final user = UserModel(
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      fullName: controller.fullName.text.trim(),
                      phoneNo:'+974${controller.phoneNo.text.trim()}',
                    );
                    await SignUpController.instance.createUser(user);
                  }
                },
                child: Text(signup.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
