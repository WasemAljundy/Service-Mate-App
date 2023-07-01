class RateQuestion {
  late int id;
  late String question;
  late String questionType;
  late String responded;
  late String active;
  late String createdAt;
  late String updatedAt;



  RateQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    questionType = json['question_type'];
    responded = json['responded'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['question_type'] = this.questionType;
    data['responded'] = this.responded;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
