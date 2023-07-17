import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/model/service.dart';
import 'package:gp_106_flutter_project/model/service_rule_price.dart';
import 'package:gp_106_flutter_project/model/specialist.dart';
import 'package:gp_106_flutter_project/model/work_time.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class ServiceApiController {
  Future<List<Service>> getServices() async {
    var url = Uri.parse(ApiSettings.services.replaceFirst('/{id}', ''));
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });
    var responseJson = jsonDecode(response.body);
    print('response.statusCode is : ${response.statusCode}');
    if (response.statusCode == 200) {
      var servicesData = responseJson['data'] as List<dynamic>;
      List<Service> services = servicesData
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList();
      return services;
    }
    return [];
  }

  Future<List<ServiceRulePrice>> getServiceRulePrices(
      {required int serviceRuleId}) async {
    var url = Uri.parse(ApiSettings.serviceRulePrices);
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      var serviceRulePrices = jsonObject['data'] as List<dynamic>;
      List<ServiceRulePrice> lists =
          serviceRulePrices.map((e) => ServiceRulePrice.fromJson(e)).toList();
      List<ServiceRulePrice> finalLists = [];
      lists.forEach((element) {
        if (element.serviceRuleId == serviceRuleId) {
          finalLists.add(element);
        }
      });
      return finalLists;
    }
    return [];
  }

  Future<Service> getServiceDetails({required int serviceId}) async {
    var url = Uri.parse(
        ApiSettings.services.replaceFirst('{id}', serviceId.toString()));
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      return Service.fromJson(jsonObject['object']);
    }
    return Service();
  }

  Future<List<WorkTime>> getServiceWorkTimes({required int serviceId}) async {
    var url = Uri.parse(
        ApiSettings.services.replaceFirst('{id}', serviceId.toString()));
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      var workTimesData = jsonObject['object']['work_times'] as List<dynamic>;
      List<WorkTime> lists =
          workTimesData.map((e) => WorkTime.fromJson(e)).toList();
      return lists;
    }
    return [];
  }
}
