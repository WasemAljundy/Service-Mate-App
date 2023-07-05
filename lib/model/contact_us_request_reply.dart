class ContactUsRequestReply {
  late int id;
  late int contactUsRequestId;
  late int objectId;
  late String reply;
  late String objectType;
  late String replyedType;



  ContactUsRequestReply();

  ContactUsRequestReply.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reply = json['reply'];
    objectType = json['object_type'];
    objectId = json['object_id'];
    replyedType = json['replyed_type'];
    contactUsRequestId = json['contact_us_request_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['reply'] = reply;
    data['object_type'] = objectType;
    data['object_id'] = objectId;
    data['replyed_type'] = replyedType;
    data['contact_us_request_id'] = contactUsRequestId;

    return data;
  }
}