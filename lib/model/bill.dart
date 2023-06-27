class Bill {
  late int id;
  late int billNumber;
  late String dateTime;
  late int amount;
  late String details;
  late int discount;
  late int reservationId;

  Bill({
    required this.billNumber,
    required this.dateTime,
    required this.amount,
    required this.details,
    required this.discount,
    required this.reservationId,
  });

  // Bill.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   image = json['image'];
  // }
}
