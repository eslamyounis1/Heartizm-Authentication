import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/login_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Obx(() {
      var isDark = Get.find<LoginController>().theme.value == "dark";

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(LineAwesomeIcons.angle_left,
                color: isDark ? Colors.white : Colors.black),
          ),
          title: Text(
            hEditProfile,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                if (Get.find<LoginController>().theme.value == "dark") {
                  Get.changeThemeMode(ThemeMode.light);
                  Get.find<LoginController>().theme.value = "light";
                  Get.find<LoginController>().update();
                  await prefs.setString("theme", "light");
                } else {
                  Get.changeThemeMode(ThemeMode.dark);
                  Get.find<LoginController>().theme.value = "dark";
                  Get.find<LoginController>().update();
                  await prefs.setString("theme", "dark");
                }
              },
              icon: Icon(
                Get.find<LoginController>().theme.value == "dark"
                    ? LineAwesomeIcons.sun
                    : LineAwesomeIcons.moon,
                color: Get.find<LoginController>().theme.value == "dark"
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  if(snapshot.hasData){
                    UserModel userData = snapshot.data as UserModel;
                    return Container(
                      padding: const EdgeInsets.all(defaultSize),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width: 120.0,
                                height: 120.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const Image(
                                    image: AssetImage(profileImg),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 35.0,
                                    height: 35.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.0),
                                      color: primaryColor,
                                    ),
                                    child: const Icon(
                                      LineAwesomeIcons.camera,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50.0),
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  readOnly: true,
                                  initialValue:
                                  userData.fullName,
                                  decoration: const InputDecoration(
                                    label: Text(fullName),
                                    prefixIcon: Icon(LineAwesomeIcons.user),
                                  ),
                                ),
                                const SizedBox(height: formHeight - 20),
                                TextFormField(
                                  readOnly: true,
                                  initialValue:
                                  userData.email,
                                  decoration: const InputDecoration(
                                    label: Text(hEmail),
                                    prefixIcon: Icon(LineAwesomeIcons.envelope_1),
                                  ),
                                ),
                                const SizedBox(height: formHeight - 20),
                                TextFormField(
                                  readOnly: true,
                                  initialValue:
                                  userData.phoneNo,
                                  decoration: const InputDecoration(
                                    label: Text(phoneNo),
                                    prefixIcon: Icon(LineAwesomeIcons.phone),
                                  ),
                                ),
                                /*  const SizedBox(height: formHeight - 20),
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text(hPassword),
                              prefixIcon: Icon(Icons.fingerprint),
                            ),
                          ), */
                                const SizedBox(height: formHeight),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryColor,
                                      side: BorderSide.none,
                                      shape: const StadiumBorder(),
                                    ),
                                    child: const Text(
                                      hEditProfile,
                                      style: TextStyle(
                                        color: darkColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: formHeight),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Delete Account:',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                                    // const Text.rich(
                                    //   TextSpan(
                                    //     text: hJoined,
                                    //     style: TextStyle(fontSize: 12.0),
                                    //     children: [
                                    //       TextSpan(
                                    //           text: hJoinedAt,
                                    //           style: TextStyle(
                                    //               fontWeight: FontWeight.bold,
                                    //               fontSize: 12.0))
                                    //     ],
                                    //   ),
                                    // ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        Colors.redAccent.withOpacity(0.1),
                                        elevation: 0,
                                        foregroundColor: Colors.red,
                                        shape: const StadiumBorder(),
                                        side: BorderSide.none,
                                      ),
                                      child: const Text(hDelete),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }else if (snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()),);

                  }else{
                    return const Center(child: Text('Something went wrong'),);

                  }
                }else{
                  return Container();
                }
              },

            ),
          ),
        ),
      );
    });
  }
}
