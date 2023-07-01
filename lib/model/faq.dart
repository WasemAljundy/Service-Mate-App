class Faq {
  late int id;
  late int active;
  late int serviceId;
  late String question;
  late String answer;
  late String createdAt;
  late String updatedAt;
  late String visablity;


  Faq.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    active = json['active'];
    serviceId = json['service_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    visablity = json['visablity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['active'] = this.active;
    data['service_id'] = this.serviceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['visablity'] = this.visablity;
    return data;
  }
}
