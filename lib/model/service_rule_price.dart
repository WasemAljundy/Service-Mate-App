class ServiceRulePrice {
  late int id;
  late int newPrice;
  late int oldPrice;
  late String details;
  late int active;
  late int currencyId;
  late int serviceRuleId;



  ServiceRulePrice();

  ServiceRulePrice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    newPrice = json['new_price'];
    oldPrice = json['old_price'];
    details = json['details'];
    active = json['active'];
    currencyId = json['currency_id'];
    serviceRuleId = json['service_rule_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['new_price'] = newPrice;
    data['old_price'] = oldPrice;
    data['details'] = details;
    data['active'] = active;
    data['currency_id'] = currencyId;
    data['service_rule_id'] = serviceRuleId;

    return data;
  }
}
