import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gp_106_flutter_project/api/controller/address_api_controller.dart';
import 'package:gp_106_flutter_project/api/controller/attacment_api_controller.dart';
import 'package:gp_106_flutter_project/api/controllers/auth_api_controller.dart';
import 'package:gp_106_flutter_project/model/addresses.dart';
import 'package:gp_106_flutter_project/model/attachment.dart';
import 'package:gp_106_flutter_project/model/attachment_type.dart';
class AddressGetXController extends GetxController{

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }

  bool load = false;
  List<Address> addresses = [];

  final AddressApiController _apiController = AddressApiController();
  static AddressGetXController  get to => Get.find<AddressGetXController>();

  Future<void> getAddress() async {
    load = true;
    addresses = await _apiController.getAddress();
    load = false;
    update();
  }

  Future<void> createAddress({required Address addressModel,required BuildContext context ,required AddAddressCallBack callBack}) async {
    await _apiController.createAddress(address: addressModel, context: context, callBack: ({required String message,required bool status,Address? address}) {
      if(address != null){
        addresses.add(address);
        update();
      }
      callBack(status: status,message: message);
    },);
    update();
  }

  Future<void> updateAddress({required int id,required Address addressModel,required BuildContext context ,required AddAddressCallBack callBack}) async {
    await _apiController.updateAddress(id: id,address: addressModel, context: context, callBack: ({required String message,required bool status,Address? address}) {
      if(address != null){
        int index = addresses.indexWhere((element) => element.id == id);
        if(index != -1){
          addresses[index] = address;
        }else{
          print('error');
        }
      }
      callBack(status: status,message: message);
    },);
    update();

  }


  Future<bool> deleteAttachment({required int id,required BuildContext context})async{
    bool deleted = await _apiController.deleteAddress(context: context, id: id);
    if(deleted){
      int index = addresses.indexWhere((element) => element.id == id );
      if(index != -1){
        addresses.removeAt(index);
      }
    }
    update();

    return deleted;
  }







}