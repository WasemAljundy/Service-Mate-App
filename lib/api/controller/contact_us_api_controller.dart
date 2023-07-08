import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/model/addresses.dart';
import 'package:gp_106_flutter_project/model/contact_us_request.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class ContactUsApiController with Helpers{
  Future<bool> createContactUs({required BuildContext context , required ContactUsRequest contactUsRequest}) async {
    var url  = Uri.parse(ApiSettings.contactUs);
    var response = await http.post(url,
        headers: {
          HttpHeaders.acceptHeader:'application/json',
          HttpHeaders.authorizationHeader: SharedPrefController().token,

        },
        body: {
          'name': contactUsRequest.name,
          'email':  SharedPrefController().email,
          'client_id': SharedPrefController().clientID.toString(),
          'mobile': contactUsRequest.mobile,
          'subject': contactUsRequest.subject,
          'message': contactUsRequest.message,
          'summary': contactUsRequest.summary,
          'status': contactUsRequest.status,
        }
    );

    var responseJson = jsonDecode(response.body);

    print(response.statusCode);
    if(response.statusCode == 201){
      showSnackBar(context: context, message:responseJson['message']);
     return true;
    }
    else if (response.statusCode == 400){
      showSnackBar(context: context, message:responseJson['message'],error: true);
      return false;
    }else{
      showSnackBar(context: context, message:responseJson['message'],error: true);
      return false;
    }
  }

}

