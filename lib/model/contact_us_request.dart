import 'package:gp_106_flutter_project/model/contact_us_request_reply.dart';

class ContactUsRequest {
  late int id;
  late int clientId;
  late String name;
  late String status;
  late String email;
  late String mobile;
  late String subject;
  late String message;
  late String summary;
  late String createdAt ;
  late String updatedAt ;
  List<ContactUsRequestReply>? contactUsRequestReplies;



  ContactUsRequest();

  ContactUsRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    email = json['email'];
    mobile = json['mobile'];
    subject = json['subject'];
    message = json['message'];
    summary = json['summary'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    clientId = json['client_id'];
    if (json['contact_us_request_replies'] != null) {
      var repliesJson = json['contact_us_request_replies'] as List<dynamic>;
      contactUsRequestReplies = repliesJson
          .map((reply) => ContactUsRequestReply.fromJson(reply))
          .toList();
    }
  }
  
}
