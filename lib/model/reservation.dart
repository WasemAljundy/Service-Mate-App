class Reservation {
  late int id;
  late String details;
  late double price;
  late int specialistId;
  late int serviceId;
  late int clientId;
  late int serviceRuleId;
  late int serviceRulePriceId;

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    details = json['details'];
    price = json['price'];
    specialistId = json['specialist_id'];
    serviceId = json['service_id'];
    clientId = json['client_id'];
    serviceRuleId = json['service_rule_id'];
    serviceRulePriceId = json['service_rule_price_id'];
  }
  
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map['id'] = id;
    map['details'] = details;
    map['price'] = price;
    map['specialist_id'] = specialistId;
    map['service_id'] = serviceId;
    map['client_id'] = clientId;
    map['service_rule_id'] = serviceRuleId;
    map['service_rule_price_id'] = serviceRulePriceId;
    return map;
  }
}
