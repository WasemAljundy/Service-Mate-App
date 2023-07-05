class FinancialStatement {
  late int id;
  late int paidAmount;
  late int remains;
  late int billId;
  late int paymentMethodId;
  late String details;
  late String billNumber;
  late String paymentDate;


  FinancialStatement();


  FinancialStatement.a({
    required details,
    required paymentDate,
    required paidAmount,
    required remains,
    id= 1,
    billId= 1,
    billNumber= "0",

    paymentMethodId = 0,
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

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['id'] = id;
    data['details'] = details;
    data['bill_number'] = billNumber;
    data['payment_date'] = paymentDate;
    data['paid_amount'] = paidAmount;
    data['remains'] = remains;
    data['bill_id'] = billId;
    data['payment_method_id'] = paymentMethodId;

    return data;
  }
}
