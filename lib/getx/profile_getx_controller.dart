import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gp_106_flutter_project/api/controllers/profile_api_controller.dart';
import 'package:gp_106_flutter_project/model/client.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';

class ProfileGetxController extends GetxController {

  Client client = Client();
  final ProfileApiController _profileApiController = ProfileApiController();
  static ProfileGetxController get to => Get.find();

  @override
  void onInit() {
    readProfile();
    super.onInit();
  }

  Future<void> readProfile() async {
    client = await _profileApiController.getClient(
        id: SharedPrefController().clientID.toString());
    update();
  }

  Future<void> updateClientGetx(BuildContext context, String id,
      String fullName, String gender, String mobile, String birthDate,
      String path) async {
    await _profileApiController.updateClient(
        context, id: id,
        fullName: fullName,
        gender: gender,
        mobile: mobile,
        birthDate: birthDate,
        path: path
    );
  }


}
