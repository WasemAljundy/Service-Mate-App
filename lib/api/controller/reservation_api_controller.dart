import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/model/appointment.dart';
import 'package:gp_106_flutter_project/model/reservation.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class ReservationApiController with Helpers {

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

  Future<List<Reservation>> getFavoriteReservations() async {
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

      List<Reservation> favorites = [];
      reservations.forEach((element) {
        if(element.favouriteCount == 1){
          favorites.add(element);
        }
      });
      return favorites;
    }
    return [];
  }

  Future<int> createReservation({required Reservation reservation , required BuildContext context}) async {
    var url  = Uri.parse(ApiSettings.reservations);
    var response = await http.post(url,headers: {
      HttpHeaders.acceptHeader:'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    },
    body: {
      'service_id':reservation.serviceId.toString(),
      'service_rule_id':reservation.serviceRuleId.toString(),
      'service_rule_price_id':reservation.serviceRulePriceId.toString(),
      'specialist_id':reservation.specialistId.toString(),
      'client_id':reservation.clientId.toString(),
      'price':reservation.price.toString(),
      'details':reservation.details,
    }
    );
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 201){
      showSnackBar(context: context, message: responseJson['message']);
      int  id = responseJson['reservation']['id'];
      return id;
    }else if(response.statusCode == 400){
      showSnackBar(context: context, message: responseJson['message'],error: true);
    }else{
      showSnackBar(context: context, message: responseJson['message'],error: true);
    }
    return 0;
  }


  Future<bool> createAppointment({required Appointment appointment , required BuildContext context}) async {
    var url  = Uri.parse(ApiSettings.appointments);
    var response = await http.post(url,headers: {
      HttpHeaders.acceptHeader:'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    },
        body: {
          'date':appointment.date,
          'startTime':appointment.startTime,
          'endTime':appointment.endTime,
          'report':appointment.report,
          'status':appointment.status,
          'type':appointment.type,
          'duration':appointment.duration,
          'reservation_id':appointment.reservationId.toString(),
        }
    );
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 201){
      showSnackBar(context: context, message: responseJson['message']);
      return true;
    }else if(response.statusCode == 400){
      showSnackBar(context: context, message: responseJson['message'],error: true);
      return false;
    }else{
      showSnackBar(context: context, message: responseJson['message'],error: true);
      return false;
    }
  }




}

