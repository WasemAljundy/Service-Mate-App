import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/api/controllers/profile_api_controller.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/getx/profile_getx_controller.dart';
import 'package:gp_106_flutter_project/model/client.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:gp_106_flutter_project/screens_keys.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileGetxController controller = Get.put(ProfileGetxController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColors,
      body: GetBuilder<ProfileGetxController>(
        init: ProfileGetxController(),
        builder: (controller) {
          if (controller.load) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                Container(
                  color: primaryColors,
                  height: 10,
                ),
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                        margin: const EdgeInsetsDirectional.only(top: 50),
                        padding: const EdgeInsetsDirectional.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(20),
                            topEnd: Radius.circular(20),
                          ),
                        ),
                        width: double.infinity,
                        child: ListView(
                          physics: const ClampingScrollPhysics(),
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                controller.client.fullName!,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColors,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              contentPadding: EdgeInsetsDirectional.zero,
                              title: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email address',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                controller.client.email!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: const Icon(Icons.email),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              contentPadding: EdgeInsetsDirectional.zero,
                              title: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gender',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                controller.client.gender!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: const Icon(Icons.male),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              contentPadding: EdgeInsetsDirectional.zero,
                              title: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Phone Number',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                controller.client.mobile!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: const Icon(Icons.phone),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              contentPadding: EdgeInsetsDirectional.zero,
                              title: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Birthdate',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                controller.client.birthDate!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: const Icon(Icons.date_range),
                            ),
                            ListTile(
                              contentPadding: EdgeInsetsDirectional.zero,
                              title: const Text(
                                'more address',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              onTap: () => Navigator.pushNamed(
                                  context, ScreenKeys.addressesScreen),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, ScreenKeys.updateProfileScreen),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 50),
                              ),
                              child: const Text(
                                'Update Profile',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 115,
                        width: 115,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.network(
                            controller.client.image ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
        // child: ,
      ),
    );
  }
}
