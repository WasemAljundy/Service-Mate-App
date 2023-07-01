class FinancialStatement {
  late int id;
  late String details;
  late String paymentDate;
  late int paidAmount;
  late int remains;
  late String paymentMethod;

  FinancialStatement({
    required this.details,
    required this.paymentDate,
    required this.paidAmount,
    required this.remains,
    required this.paymentMethod,
  });

  // FinancialStatement.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   image = json['image'];
  // }
}
