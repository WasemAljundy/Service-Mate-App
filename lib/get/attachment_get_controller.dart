import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gp_106_flutter_project/api/controller/attacment_api_controller.dart';
import 'package:gp_106_flutter_project/api/controllers/auth_api_controller.dart';
import 'package:gp_106_flutter_project/model/attachment.dart';
import 'package:gp_106_flutter_project/model/attachment_type.dart';
class AttachmentGetXController extends GetxController{

  @override
  void onInit() {
    getAttachments();
    super.onInit();
  }

  bool load = false;
  List<Attachment> attachments = [];

  final AttachmentApiController _apiController = AttachmentApiController();
  static AttachmentGetXController  get to => Get.find<AttachmentGetXController>();

  Future<void> getAttachments() async {
    load = true;
    attachments = await _apiController.getAttachments();
    load = false;
    update();
  }



  Future<AttachmentType> getAttachmentSingle({required int? id}) async {
    AttachmentType attachmentType  = await _apiController.getAttachmentType(id: id);
    update();
    return attachmentType;
  }



  Future<void> createAttachment({required Attachment attachment,required BuildContext context ,required String path,required CreateCallBack callBack}) async {
    await _apiController.createAttachment(attachment: attachment, context: context, path: path, callBack: ({required String message,required bool status,Attachment? attachment}) {
      if(attachment != null){
        attachments.add(attachment);
        update();
      }
      callBack(status: status,message: message);
      update();
    },);
    update();
  }


  Future<bool> deleteAttachment({required int id,required BuildContext context})async{
    bool deleted = await _apiController.deleteAttachment(context: context, id: id);
    if(deleted){
      int index = attachments.indexWhere((element) => element.id == id );
      if(index != -1){
        attachments.removeAt(index);
      }
    }
    return deleted;
  }
  
  





}