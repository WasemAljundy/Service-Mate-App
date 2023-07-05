import 'package:get/get.dart';
import 'package:gp_106_flutter_project/api/controller/attacment_api_controller.dart';
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
    print('attachments.length is : ${attachments.length}');
    load = false;
    update();
  }

  Future<AttachmentType> getAttachmentType({required int id}) async {
    AttachmentType attachmentType  = await _apiController.getAttachmentType(id: id);
    update();
    return attachmentType;
  }




}