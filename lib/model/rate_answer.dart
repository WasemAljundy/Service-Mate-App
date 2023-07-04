class RateAnswer {
  late int id;
  late String answer;
  late int rateId;
  late int rateQuestionId;


  RateAnswer();

  RateAnswer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
    rateId = json['rate_id'];
    rateQuestionId = json['rate_question_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['answer'] = answer;
    data['rate_id'] = rateId;
    data['rate_question_id'] = rateQuestionId;

    return data;
  }
}
