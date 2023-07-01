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
  late String createdAt;
  late String updatedAt;


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
    clientId = json['client_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['subject'] = this.subject;
    data['message'] = this.message;
    data['summary'] = this.summary;
    data['client_id'] = this.clientId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
