import 'dart:convert';
import 'dart:io';

import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/model/faq.dart';
import 'package:http/http.dart' as http;

class FaqApiController {

  Future<List<Faq>> getFaqs() async {
    var url  = Uri.parse(ApiSettings.faqs.replaceFirst('/{id}', ''));
    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json'
    });
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      var faqs = responseJson['data'] as List;
      return faqs.map((e) => Faq.fromJson(e)).toList();
    }
    return [];
  }

  Future<Faq> showFaq({required int id}) async {
    var url  = Uri.parse(ApiSettings.faqs.replaceFirst('/{id}', id.toString()));
    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json'
    });
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      return Faq.fromJson(responseJson['faq']);
    }
    return Faq();
  }



}


