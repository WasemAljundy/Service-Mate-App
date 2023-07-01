class RateAnswer {
  late int id;
  late String answer;
  late int rateId;
  late int rateQuestionId;
  late String createdAt;
  late String updatedAt;

  RateAnswer();

  RateAnswer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
    rateId = json['rate_id'];
    rateQuestionId = json['rate_question_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['answer'] = this.answer;
    data['rate_id'] = this.rateId;
    data['rate_question_id'] = this.rateQuestionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
