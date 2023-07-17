import 'package:gp_106_flutter_project/model/specialist.dart';

class ContactUsRequestReply {
  late int id;
  late int contactUsRequestId;
  late String reply;
  Specialist? specialist;


  ContactUsRequestReply();

  ContactUsRequestReply.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reply = json['reply'];
    contactUsRequestId = json['contact_us_request_id'];
    if(json['object'] != null){
      specialist = Specialist.fromJson(json['object']);
    }
  }



}