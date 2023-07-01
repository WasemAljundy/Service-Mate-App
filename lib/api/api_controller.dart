import 'dart:convert';
import 'dart:io';

import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/model/service.dart';
import 'package:http/http.dart' as http;

class ApiController {


  Future<List<Service>> getService() async {
    Uri uri = Uri.parse(ApiSettings.service);

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['Service'] as List;
      return jsonArray.map((json) => Service.fromJson(json)).toList();
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
