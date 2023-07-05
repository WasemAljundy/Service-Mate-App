import 'dart:convert';
import 'dart:io';

import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/model/article.dart';
import 'package:gp_106_flutter_project/model/category.dart';
import 'package:http/http.dart' as http;

class ArticleApiController {

  Future<List<Article>> getArticles() async {
    var url  = Uri.parse(ApiSettings.articels.replaceFirst('/{id}', ''));
    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json'
    });
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      var articles = responseJson['data'] as List;
      return articles.map((e) => Article.fromJson(e)).toList();
    }
    return [];
  }

  Future<Article> showArticles({required int id}) async {
    var url  = Uri.parse(ApiSettings.articels.replaceFirst('/{id}','/$id'));
    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json'
    });
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      return Article.fromJson(responseJson['article']);
    }
    return Article();
  }
}

