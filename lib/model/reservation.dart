class Reservation {
  late int id;
  late int price;
  late int clientId;
  late int serviceId;
  late int specialistId;
  late int serviceRuleId;
  late int serviceRulePriceId;
  late String details;



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
 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['id'] = id;
    data['price'] = price;
    data['details'] = details;
    data['client_id'] = clientId;
    data['service_id'] = serviceId;
    data['specialist_id'] = specialistId;
    data['service_rule_id'] = serviceRuleId;
    data['service_rule_price_id'] = serviceRulePriceId;
  
    return data;
  }
}
