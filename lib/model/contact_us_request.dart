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

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['email'] = email;
    data['mobile'] = mobile;
    data['subject'] = subject;
    data['message'] = message;
    data['summary'] = summary;
    data['client_id'] = clientId;

    return data;
  }
}
