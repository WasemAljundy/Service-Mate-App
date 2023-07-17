

class Bill {
  late int id;
  late int amount;
  late int discount;
  late int reservationId;
  late String dateTime;
  late String details;
  late String billNumber;
  late String status;

  late String visablity;

  Bill();


  Bill.a({
    id = 1,
    required amount,
    required discount,
    required reservationId,
    dateTime = "0",
    required details,
    required billNumber,
    status = "0",
    visablity= "0"
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
    visablity = json['visablity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['date_time'] = dateTime;
    data['amount'] = amount;
    data['details'] = details;
    data['bill_number'] = billNumber;
    data['status'] = status;
    data['discount'] = discount;
    data['reservation_id'] = reservationId;

    data['visablity'] = visablity;
    return data;
  }
}
