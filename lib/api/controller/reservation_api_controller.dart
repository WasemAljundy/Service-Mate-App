import 'dart:convert';
import 'dart:io';

import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/model/reservation.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class ReservationApiController {

  Future<List<Reservation>> getReservations() async {
    var url  = Uri.parse(ApiSettings.reservations);
    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,

    });
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      var reservationsData = responseJson['data'] as List<dynamic>;
      List<Reservation> reservations = reservationsData
          .map((e) => Reservation.fromJson(e as Map<String, dynamic>))
          .toList();
      return reservations;
    }
    return [];
  }
}

