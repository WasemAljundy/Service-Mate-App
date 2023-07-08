class Faq {
  late int id;
  late int active;
  late int serviceId;
  late String question;
  late String answer;

  Faq();

  Faq.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    active = json['active'];
    serviceId = json['service_id'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['question'] = question;
    data['answer'] = answer;
    data['active'] = active;
    data['service_id'] = serviceId;
    return data;
  }
}

