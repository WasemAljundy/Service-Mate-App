class Reservation {
  late int id;
  late int price;
  late int clientId;
  late int serviceId;
  late int specialistId;
  late int serviceRuleId;
  late int serviceRulePriceId;
  late String details;
  late String createdAt;
  late String updatedAt;


  Reservation();

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    details = json['details'];
    clientId = json['client_id'];
    serviceId = json['service_id'];
    specialistId = json['specialist_id'];
    serviceRuleId = json['service_rule_id'];
    serviceRulePriceId = json['service_rule_price_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['details'] = this.details;
    data['client_id'] = this.clientId;
    data['service_id'] = this.serviceId;
    data['specialist_id'] = this.specialistId;
    data['service_rule_id'] = this.serviceRuleId;
    data['service_rule_price_id'] = this.serviceRulePriceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
