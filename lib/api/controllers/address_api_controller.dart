import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/model/addresses.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

typedef AddAddressCallBack = void Function(
    {required String message,
    required bool status,
    Address? address
    });



class AddressApiController with Helpers{


    Future<void> createAddress({required BuildContext context , required Address address,required AddAddressCallBack callBack}) async {
      var url  = Uri.parse(ApiSettings.address.replaceFirst('/{id}', ''));
      var response = await http.post(url,
          headers: {
            HttpHeaders.acceptHeader:'application/json',
            HttpHeaders.authorizationHeader: SharedPrefController().token,

          },
          body: {
            'name': address.name,
            'street': address.street,
            'client_id': SharedPrefController().clientID.toString(),
            'primary': address.primary,
            'building': address.building,
            'flat_id': address.flatId.toString(),
          }
      );

      var responseJson = jsonDecode(response.body);

      if(response.statusCode == 201){
        String name = responseJson['address']['name'];
        String building = responseJson['address']['building'];
        String primary = responseJson['address']['primary'];
        String flat_id = responseJson['address']['flat_id'];
        String street = responseJson['address']['street'];
        String client_id = responseJson['address']['client_id'];
        int id = responseJson['address']['id'];
        Address a = Address();
        a.name = name;
        a.building =building;
        a.street =street;
        a.primary =primary;
        a.flatId = int.parse(flat_id);
        a.id = id;
        a.clientId = int.parse(client_id);
        callBack(message:responseJson['message'],status: true, address:a);
      }
      else if (response.statusCode == 400){
        callBack(message:responseJson['message'],status: false);
      }else{
        callBack(message:responseJson['message'],status: false,);
      }
    }
    Future<void> updateAddress({required int id,required BuildContext context , required Address address,required AddAddressCallBack callBack}) async {
      var url  = Uri.parse(ApiSettings.address.replaceFirst('{id}', id.toString()));
      var response = await http.put(url,
          headers: {
            HttpHeaders.acceptHeader:'application/json',
            HttpHeaders.authorizationHeader: SharedPrefController().token,

          },
          body: {
            'name': address.name,
            'street': address.street,
            'client_id': SharedPrefController().clientID.toString(),
            'primary': address.primary,
            'building': address.building,
            'flat_id': address.flatId.toString(),
          }
      );

      var responseJson = jsonDecode(response.body);

      if(response.statusCode == 200){
        String name = responseJson['address']['name'];
        String building = responseJson['address']['building'];
        String primary = responseJson['address']['primary'];
        String flat_id = responseJson['address']['flat_id'];
        String street = responseJson['address']['street'];
        String client_id = responseJson['address']['client_id'];
        int id = responseJson['address']['id'];
        Address a = Address();
        a.name = name;
        a.building =building;
        a.street =street;
        a.primary = primary == '0' ?'false' :'true';
        a.flatId = int.parse(flat_id);
        a.id = id;
        a.clientId = int.parse(client_id);
        callBack(message:responseJson['message'],status: true, address:a);
      }
      else if (response.statusCode == 400){
        callBack(message:responseJson['message'],status: false);
      }else{
        callBack(message:responseJson['message'],status: false,);
      }
    }

  Future<List<Address>> getAddress()async {
    var url = Uri.parse(ApiSettings.address.replaceFirst('/{id}',''));
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });
    var responseJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var addressData = responseJson['data'] as List<dynamic>;
      List<Address> address = addressData
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList();
      return address;
    }
    return [];
  }



  Future<bool> deleteAddress({required BuildContext context , required int id})async{
    var url  = Uri.parse(ApiSettings.address.replaceFirst('{id}',id.toString()));
    var response = await http.delete(url,headers: {
      HttpHeaders.authorizationHeader:SharedPrefController().token,
      HttpHeaders.acceptHeader:'application/json'
    });

    var jsonResponse = jsonDecode(response.body);

    if(response.statusCode == 200){
      showSnackBar(context: context, message: jsonResponse['message']);
      return true;
    }else{
      showSnackBar(context: context, message: jsonResponse['message'],error: true);
      return false;
    }
  }

}