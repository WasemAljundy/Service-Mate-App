import 'dart:convert';
import 'dart:io';

import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/model/category.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class CategoryApiController {

  Future<List<Category>> getCategories() async {
    var url  = Uri.parse(ApiSettings.categories);
    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,

    });
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      var categories = responseJson['data'] as List;
      return categories.map((e) => Category.fromJson(e)).toList();
    }
    return [];
  }
}

