import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/model/contact_us_request.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;


typedef CreateContactUsCallBack = void Function(
    {required String message,
    required bool status,
    ContactUsRequest? contactUsRequest
    });



class ContactUsApiController with Helpers{

  Future<void> createContactUs({required ContactUsRequest contactUsRequest,required CreateContactUsCallBack callBack}) async {
    var url  = Uri.parse(ApiSettings.contactUs.replaceFirst('/{id}', ''));
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
    if(response.statusCode == 201){
        String name = responseJson['contactUsRequest']['name'];
        String email = responseJson['contactUsRequest']['email'];
        String mobile = responseJson['contactUsRequest']['mobile'];
        String subject = responseJson['contactUsRequest']['subject'];
        String message = responseJson['contactUsRequest']['message'];
        String summary = responseJson['contactUsRequest']['summary'];
        String status = responseJson['contactUsRequest']['status'];
        String updated_at = responseJson['contactUsRequest']['updated_at'];
        String created_at = responseJson['contactUsRequest']['created_at'];
        String client_id = responseJson['contactUsRequest']['client_id'];
        int id = responseJson['contactUsRequest']['id'];
        ContactUsRequest contact = ContactUsRequest();
        contact.name = name;
        contact.email =email;
        contact.mobile =mobile;
        contact.subject =subject;
        contact.message =message;
        contact.summary =summary;
        contact.status =status;
        contact.updatedAt =updated_at;
        contact.createdAt =created_at;
        contact.id = id;
        contact.clientId = int.parse(client_id);
      callBack(status: true,message:responseJson['message'],contactUsRequest: contact);
    }
    else if (response.statusCode == 400){
      callBack(status: true,message:responseJson['message']);
    }else{
      callBack(status: true,message:responseJson['message']);
    }
  }

  Future<ContactUsRequest> contactUsDetails({required int id}) async {
    var url  = Uri.parse(ApiSettings.contactUs.replaceFirst('{id}', id.toString()));
    var response = await http.get(url,
        headers: {
          HttpHeaders.acceptHeader:'application/json',
          HttpHeaders.authorizationHeader: SharedPrefController().token,
        },
    );
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      ContactUsRequest contactUsRequest = ContactUsRequest.fromJson(responseJson['contactUsRequest']);
      return contactUsRequest;
    }
    return ContactUsRequest();
  }

  Future<List<ContactUsRequest>> getContactUsRequests() async {
    var url  = Uri.parse(ApiSettings.contactUs.replaceFirst('/{id}', ''));
    var response = await http.get(url,
      headers: {
        HttpHeaders.acceptHeader:'application/json',
        HttpHeaders.authorizationHeader: SharedPrefController().token,
      },
    );
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      var contactsData = responseJson['data'] as List<dynamic>;
      List<ContactUsRequest> contactUsRequests = contactsData
          .map((e) => ContactUsRequest.fromJson(e as Map<String, dynamic>))
          .toList();

      List<ContactUsRequest> lists= [];
      contactUsRequests.forEach((element) {
        if(SharedPrefController().clientID == element.clientId){
          lists.add(element);
        }
      });
      return lists;
    }
    return [];
  }

}

