class ServiceRulePrice {
  late int id;
  late int newPrice;
  late int oldPrice;
  late String details;
  late int active;
  late int currencyId;
  late int serviceRuleId;
  late String createdAt;
  late String updatedAt;



  ServiceRulePrice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    newPrice = json['new_price'];
    oldPrice = json['old_price'];
    details = json['details'];
    active = json['active'];
    currencyId = json['currency_id'];
    serviceRuleId = json['service_rule_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['new_price'] = this.newPrice;
    data['old_price'] = this.oldPrice;
    data['details'] = this.details;
    data['active'] = this.active;
    data['currency_id'] = this.currencyId;
    data['service_rule_id'] = this.serviceRuleId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
