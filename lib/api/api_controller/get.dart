
import 'dart:convert';
import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/model/experience.dart';
import 'package:gp_106_flutter_project/model/service.dart';
import 'package:http/http.dart' as http;



class GetApiData {



  Future<List<Service>> getService() async {
    Uri uri = Uri.parse(ApiSettings.service);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'] as List;
      return jsonArray.map((json) => Service.fromJson(json)).toList();
    }
    return [];
  }

  Future<List<Experience>> getExperience() async {
    Uri uri = Uri.parse(ApiSettings.experience);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'] as List;
      return jsonArray.map((json) => Experience.fromJson(json)).toList();
    }
    return [];
  }



  Future<List<Service>> getFaq() async {
    Uri uri = Uri.parse(ApiSettings.service);

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['Service'] as List;
      return jsonArray.map((json) => Service.fromJson(json)).toList();
    }
    return [];
  }


}