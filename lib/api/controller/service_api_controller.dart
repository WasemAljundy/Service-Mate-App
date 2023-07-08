import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/model/service.dart';
import 'package:gp_106_flutter_project/model/specialist.dart';
import 'package:gp_106_flutter_project/model/work_time.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
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

  // Future<List<WorkTime>> getWorkTimesWithSpecialist({required int id}) async {
  //   var url  = Uri.parse(ApiSettings.services.replaceFirst('{id}',id.toString()));
  //   var response = await http.get(url,headers: {
  //     HttpHeaders.acceptHeader:'application/json'
  //   });
  //   var responseJson = jsonDecode(response.body);
  //   if(response.statusCode == 200){
  //     var workTimesData = responseJson['Service']['work_times'];
  //     List<WorkTime> workTimes = List<WorkTime>.from(workTimesData.map((item) => WorkTime.fromJson(item)));
  //     print('workTimes.length is: ${workTimes.length}');
  //     return workTimes;
  //   }
  //   return [];
  // }


  Future<Service> showService({required int id}) async {
    var url =
    Uri.parse(ApiSettings.services.replaceFirst('{id}', id.toString()));
    var response = await http
        .get(url, headers: {HttpHeaders.acceptHeader: 'application/json'});
    var responseJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Service.fromJson(responseJson['Service']);
    }
    return Service();
  }

  Future<Specialist> showSpecialist({required int id}) async {
    var url =
    Uri.parse(ApiSettings.specialists.replaceFirst('{id}', id.toString()));
    var response = await http
        .get(url, headers: {HttpHeaders.acceptHeader: 'application/json'});
    var responseJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Specialist specialist = Specialist.fromJson(responseJson['specialist']);
      print('full name is : ${specialist.fullName}');
      return specialist;
    }
    return Specialist();
  }

  Future<Service?> getServiceDetails({required int serviceId}) async {
    var url = Uri.parse(
        ApiSettings.services.replaceFirst('{id}', serviceId.toString()));
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });
    if (response.statusCode == 200) {
      print(response.body);
      var jsonObject = jsonDecode(response.body);
      return Service.fromJson(jsonObject['object']);
    }
    return null;
  }



  
  
}

