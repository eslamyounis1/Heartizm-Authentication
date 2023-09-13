import 'package:ecg_auth_app_heartizm/src/constants/colors.dart';
import 'package:ecg_auth_app_heartizm/src/constants/image_strings.dart';
import 'package:ecg_auth_app_heartizm/src/constants/sizes.dart';
import 'package:ecg_auth_app_heartizm/src/constants/text_strings.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/controllers/login_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/authentication/models/user_model.dart';
import 'package:ecg_auth_app_heartizm/src/features/core/controllers/profile_controller.dart';
import 'package:ecg_auth_app_heartizm/src/features/core/screens/arrhythmias/arrhythmias.dart';
import 'package:ecg_auth_app_heartizm/src/features/core/screens/update_profile/update_profile_screen.dart';
import 'package:ecg_auth_app_heartizm/src/features/core/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../arrhythmias_history/history_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            hProfile,
            style: Theme
                .of(context)
                .textTheme
                .headlineSmall,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                if (Get
                    .find<LoginController>()
                    .theme
                    .value == "dark") {
                  Get.changeThemeMode(ThemeMode.light);
                  Get
                      .find<LoginController>()
                      .theme
                      .value = "light";
                  Get.find<LoginController>().update();
                  await prefs.setString("theme", "light");
                } else {
                  Get.changeThemeMode(ThemeMode.dark);
                  Get
                      .find<LoginController>()
                      .theme
                      .value = "dark";
                  Get.find<LoginController>().update();
                  await prefs.setString("theme", "dark");
                }
              },
              icon: Icon(
                Get
                    .find<LoginController>()
                    .theme
                    .value == "dark"
                    ? LineAwesomeIcons.sun
                    : LineAwesomeIcons.moon,
                color: Get
                    .find<LoginController>()
                    .theme
                    .value == "dark" || MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if(snapshot.hasData){
                  UserModel userData = snapshot.data as UserModel;
                  return Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
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
                                        LineAwesomeIcons.alternate_pencil,
                                        size: 20.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Text(userData.fullName,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headlineSmall),
                            Text(userData.email,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyMedium),
                            const SizedBox(height: 20.0),
                            SizedBox(
                              width: 200.0,
                              child: ElevatedButton(
                                onPressed: () async {
                                  Get.to(() => const UpdateProfileScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text(
                                  hEditProfile,
                                  style: TextStyle(color: darkColor),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            const Divider(),
                            const SizedBox(height: 10.0),
                            // MENU
                            ProfileMenuWidget(
                                title: "Settings",
                                icon: LineAwesomeIcons.cog,
                                onPress: () {}),
                            ProfileMenuWidget(
                                title: "Arrhythmias Detection",
                                icon: LineAwesomeIcons.heart,
                                onPress: () async {
                                  await Get.find<LoginController>().clearLastECG();
                                  Get.to(() => const ArrhythmiasScreen());
                                }),
                            ProfileMenuWidget(
                                title: "History",
                                icon: LineAwesomeIcons.history,
                                onPress: () async {
                                  Get.to(() => const HistoryScreen());
                                  try {
                                    await Get.find<LoginController>().getAllECG();
                                  } catch (e) {
                                    Get.snackbar("Error", e.toString());
                                  }
                                }),
                            const Divider(color: Colors.grey),
                            const SizedBox(height: 10.0),
                            ProfileMenuWidget(
                                title: "App Developers",
                                icon: LineAwesomeIcons.dev,
                                onPress: () {}),
                            ProfileMenuWidget(
                              title: "Logout",
                              icon: LineAwesomeIcons.alternate_sign_out,
                              endIcon: false,
                              textColor: Colors.red,
                              onPress: () async {
                                /*  var p = await SharedPreferences.getInstance();
                            p.remove("firstTime"); */
                                AuthenticationRepository.instance.logout();
                              },
                            ),
                          ],
                        ),
                      ),

                    ],
                  );
                }else if(snapshot.hasError){
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
      );

  }
}
