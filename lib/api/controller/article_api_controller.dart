import 'dart:convert';
import 'dart:io';

import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/model/article.dart';
import 'package:gp_106_flutter_project/model/category.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class ArticleApiController {

  Future<List<Article>> getArticles() async {
    var url  = Uri.parse(ApiSettings.articels.replaceFirst('/{id}', ''));

    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,

    });
    var responseJson = jsonDecode(response.body);

    if(response.statusCode == 200){
      var articlesData = responseJson['data'] as List<dynamic>;
      List<Article> articles = articlesData
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList();
      return articles;
    }
    return [];
  }

  Future<List<Article>> getFavoriteArticles() async {
    var url  = Uri.parse(ApiSettings.articels.replaceFirst('/{id}', ''));

    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,

    });
    var responseJson = jsonDecode(response.body);

    if(response.statusCode == 200){
      var articlesData = responseJson['data'] as List<dynamic>;
      List<Article> articles = articlesData
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList();
      List<Article> favorites = [];
      articles.forEach((element) {
        if(element.favouriteCount == 1){
          favorites.add(element);
        }
      });

      print('favorites lenght isss : ${favorites.length}');

      return favorites;
    }
    return [];
  }

  Future<Article> showArticles({required int id}) async {
    var url  = Uri.parse(ApiSettings.articels.replaceFirst('/{id}','/$id'));
    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,

    });
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      return Article.fromJson(responseJson['article']);
    }
    return Article();
  }
}

