

class Bill {
  late int id;
  late int amount;
  late int discount;
  late int reservationId;
  late String dateTime;
  late String details;
  late String billNumber;
  late String status;
  late String createdAt;
  late String updatedAt;
  late String visablity;

  Bill();


  Bill.a({
    this.id = 1,
    required this.amount,
    required this.discount,
    required this.reservationId,
    this.dateTime = "0",
    required this.details,
    required this.billNumber,
    this.status = "0",
    this.createdAt= "0",
    this.updatedAt= "0",
    this.visablity= "0"
});

  Bill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateTime = json['date_time'];
    amount = json['amount'];
    details = json['details'];
    billNumber = json['bill_number'];
    status = json['status'];
    discount = json['discount'];
    reservationId = json['reservation_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    visablity = json['visablity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_time'] = this.dateTime;
    data['amount'] = this.amount;
    data['details'] = this.details;
    data['bill_number'] = this.billNumber;
    data['status'] = this.status;
    data['discount'] = this.discount;
    data['reservation_id'] = this.reservationId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['visablity'] = this.visablity;
    return data;
  }
}
