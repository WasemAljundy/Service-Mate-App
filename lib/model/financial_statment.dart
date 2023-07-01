class FinancialStatement {
  late int id;
  late int paidAmount;
  late int remains;
  late int billId;
  late int paymentMethodId;
  late String details;
  late String billNumber;
  late String paymentDate;
  late String createdAt;
  late String updatedAt;

  FinancialStatement();


  FinancialStatement.a({
    required this.details,
    required this.paymentDate,
    required this.paidAmount,
    required this.remains,
    this.id= 1,
    this.billId= 1,
    this.billNumber= "0",
    this.createdAt= "0",
    this.updatedAt = "0",
    this.paymentMethodId = 0,
  });

  FinancialStatement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    details = json['details'];
    billNumber = json['bill_number'];
    paymentDate = json['payment_date'];
    paidAmount = json['paid_amount'];
    remains = json['remains'];
    billId = json['bill_id'];
    paymentMethodId = json['payment_method_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['details'] = this.details;
    data['bill_number'] = this.billNumber;
    data['payment_date'] = this.paymentDate;
    data['paid_amount'] = this.paidAmount;
    data['remains'] = this.remains;
    data['bill_id'] = this.billId;
    data['payment_method_id'] = this.paymentMethodId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
