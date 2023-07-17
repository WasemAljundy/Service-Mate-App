class RateQuestion {
  late int id;
  late String question;
  late String questionType;
  late String responded;
  late String active;



  RateQuestion();

  RateQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    questionType = json['question_type'];
    responded = json['responded'];
    active = json['active'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['question'] = this.question;
    data['question_type'] = this.questionType;
    data['responded'] = this.responded;
    data['active'] = this.active;

    return data;
  }
}
