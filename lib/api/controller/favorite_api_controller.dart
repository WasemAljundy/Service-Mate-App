import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/model/addresses.dart';
import 'package:gp_106_flutter_project/model/contact_us_request.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class FavoriteApiController with Helpers{

  Future<bool> createArticleFavorite({required int articleId}) async {
    var url  = Uri.parse(ApiSettings.articleFavorite);
    var response = await http.post(url,
        headers: {
          HttpHeaders.acceptHeader:'application/json',
          HttpHeaders.authorizationHeader: SharedPrefController().token,
        },
        body: {
          'article_id': articleId.toString()
        }
    );
    if(response.statusCode == 200){
      return true;
    } else{
      return false;
    }
  }

  Future<bool> createReservationFavorite({required int reservationId}) async {
    var url  = Uri.parse(ApiSettings.reservationFavorite);
    var response = await http.post(url,
        headers: {
          HttpHeaders.acceptHeader:'application/json',
          HttpHeaders.authorizationHeader: SharedPrefController().token,
        },
        body: {
          'reservation_id': reservationId.toString()
        }
    );
    print('response.statusCode is : ${response.statusCode}');
    if(response.statusCode == 200){
      return true;
    } else{
      return false;
    }
  }

}

