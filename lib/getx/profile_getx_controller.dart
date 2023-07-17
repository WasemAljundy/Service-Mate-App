import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gp_106_flutter_project/api/controllers/profile_api_controller.dart';
import 'package:gp_106_flutter_project/model/client.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';

class ProfileGetxController extends GetxController {
  final ProfileApiController _profileApiController = ProfileApiController();

  bool load = false;

  static ProfileGetxController get to => Get.find();

  @override
  void onInit() {
    readProfile();
    super.onInit();
  }

  late Client client;

  void readProfile() async {
    load = true;

    client = await _profileApiController.getClient(
        id: SharedPrefController().clientID.toString());
    load = false;
    update();
  }

  Future<void> updateClient({
    required String id,
    required String fullName,
    required String gender,
    required String mobile,
    required String birthDate,
    required String path,
  }) async {
    Client? client = await _profileApiController.updateClient(
        id: id,
        fullName: fullName,
        gender: gender,
        mobile: mobile,
        birthDate: birthDate,
        path: path);
    if (client != null) {
      this.client = client;
      update();
    }
  }
}
