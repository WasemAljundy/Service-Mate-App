import 'dart:convert';
import 'dart:io';

import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/model/article.dart';
import 'package:gp_106_flutter_project/model/category.dart';
import 'package:gp_106_flutter_project/model/service.dart';
import 'package:gp_106_flutter_project/model/specialist.dart';
import 'package:gp_106_flutter_project/model/work_time.dart';
import 'package:http/http.dart' as http;

class ServiceApiController {

  Future<List<Service>> getServices() async {
    var url  = Uri.parse(ApiSettings.services.replaceFirst('/{id}', ''));
    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json'
    });
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      var services = responseJson['data'] as List;
      return services.map((e) => Service.fromJson(e)).toList();
    }
    return [];
  }

  Future<Service> showService({required int id}) async {
    var url  = Uri.parse(ApiSettings.services.replaceFirst('{id}',id.toString()));
    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json'
    });
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      return Service.fromJson(responseJson['Service']);
    }
    return Service();
  }

  Future<Specialist> showSpecialist({required int id}) async {
    var url  = Uri.parse(ApiSettings.specialists.replaceFirst('{id}',id.toString()));
    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json'
    });
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      Specialist specialist =Specialist.fromJson(responseJson['specialist']);
      print('full name is : ${specialist.fullName}');
      return specialist;
    }
    return Specialist();
  }

  Future<List<WorkTime>> getWorkTimes({required int serviceId}) async {
    var url  = Uri.parse(ApiSettings.workTimes.replaceFirst('/{id}',''));
    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json'
    });
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      var workTimes =responseJson['data'] as List;
      List<WorkTime> lists =  workTimes.map((e) => WorkTime.fromJson(e)).toList();
      List<WorkTime> finalLists = [];
      for (var element in lists) {
        if(element.serviceId == serviceId){
          finalLists.add(element);
        }
      }
      return finalLists;
    }
    return [];
  }






  
  
}

