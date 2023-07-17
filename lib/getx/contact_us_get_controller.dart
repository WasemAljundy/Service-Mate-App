import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gp_106_flutter_project/api/controllers/address_api_controller.dart';
import 'package:gp_106_flutter_project/api/controllers/attacment_api_controller.dart';
import 'package:gp_106_flutter_project/api/controllers/contact_us_api_controller.dart';
import 'package:gp_106_flutter_project/api/controllers/auth_api_controller.dart';
import 'package:gp_106_flutter_project/model/addresses.dart';
import 'package:gp_106_flutter_project/model/attachment.dart';
import 'package:gp_106_flutter_project/model/attachment_type.dart';
import 'package:gp_106_flutter_project/model/contact_us_request.dart';
class ContactUsGetXController extends GetxController{

  @override
  void onInit() {
    getContactUsRequests();
    super.onInit();
  }

  bool load = false;

  List<ContactUsRequest> contactUsRequests = [];

  final ContactUsApiController _apiController = ContactUsApiController();
  static ContactUsGetXController  get to => Get.find<ContactUsGetXController>();

  Future<void> createContactUs({required ContactUsRequest contactUsRequestModel,required CreateContactUsCallBack callBack}) async {
    await _apiController.createContactUs(contactUsRequest: contactUsRequestModel,callBack: ({contactUsRequest, required String message, required bool status}) {
      if(contactUsRequest != null){
        contactUsRequests.add(contactUsRequest);
        update();
      }
      callBack(status: status,message: message);
    },);
    update();
  }

  Future<void> getContactUsRequests() async {
    load = true;
    contactUsRequests =await  _apiController.getContactUsRequests();
    load = false;
    update();
  }

}