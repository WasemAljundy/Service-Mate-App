import 'package:gp_106_flutter_project/model/service_rule.dart';
import 'package:gp_106_flutter_project/model/service_rule_price.dart';
import 'package:gp_106_flutter_project/model/specialist.dart';

class Reservation {
  late int id;
  late int price;
  late int clientId;
  late int serviceId;
  late int specialistId;
  late int serviceRuleId;
  late int serviceRulePriceId;
  late String details;
  late bool isFavourite;
  late int favouriteCount;
  Specialist? specialist;
  ServiceRule? serviceRule;
  ServiceRulePrice? serviceRulePrice;



  Reservation();

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    details = json['details'];
    clientId = json['client_id'];
    serviceId = json['service_id'];
    specialistId = json['specialist_id'];
    isFavourite = json['is_favourite'];
    favouriteCount = json['favourite_count'];
    serviceRuleId = json['service_rule_id'];
    serviceRulePriceId = json['service_rule_price_id'];
    if(json['specialist'] != null){
      specialist = Specialist.fromJson(json['specialist']);
    }
    if(json['service_rule'] != null){
      serviceRule = ServiceRule.fromJson(json['service_rule']);
    }
    if(json['service_rule_price'] != null){
      serviceRulePrice = ServiceRulePrice.fromJson(json['service_rule_price']);
    }
  }



}
