class ContactUsRequestReply {
  late int id;
  late int contactUsRequestId;
  late int objectId;
  late String reply;
  late String objectType;
  late String replyedType;
  late String createdAt;
  late String updatedAt;


  ContactUsRequestReply();

  ContactUsRequestReply.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reply = json['reply'];
    objectType = json['object_type'];
    objectId = json['object_id'];
    replyedType = json['replyed_type'];
    contactUsRequestId = json['contact_us_request_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reply'] = this.reply;
    data['object_type'] = this.objectType;
    data['object_id'] = this.objectId;
    data['replyed_type'] = this.replyedType;
    data['contact_us_request_id'] = this.contactUsRequestId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}