import 'package:gp_106_flutter_project/model/service_rule_price.dart';

class ServiceRule {
  late int id;
  late int cost;
  late int lat;
  late int long;
  late int serviceId;
  late int active;
  late String image;
  late String paymentRule;
  late String performType;
  late String location;
   List<ServiceRulePrice>? serviceRulePrices;



  ServiceRule();

  ServiceRule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    cost = json['cost'];
    paymentRule = json['payment_rule'];
    performType = json['perform_type'];
    active = json['active'];
    location = json['location'];
    lat = json['lat'];
    long = json['long'];
    serviceId = json['service_id'];

    if (json['service_rule_prices'] != null) {
      serviceRulePrices = [];
      json['service_rule_prices'].forEach((v) {
        serviceRulePrices!.add(ServiceRulePrice.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['id'] = id;
    data['image'] = image;
    data['cost'] = cost;
    data['payment_rule'] = paymentRule;
    data['perform_type'] = performType;
    data['active'] = active;
    data['location'] = location;
    data['lat'] = lat;
    data['long'] = long;
    data['service_id'] = serviceId;

    return data;
  }
}