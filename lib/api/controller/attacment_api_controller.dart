import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/model/attachment.dart';
import 'package:gp_106_flutter_project/model/attachment_type.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;


typedef AddAttachmentCallBack = void Function(
    {required String message,
    required bool status,
     Attachment? attachment
    });
class AttachmentApiController with Helpers {



  Future<List<Attachment>> getAttachments() async {
    var url  = Uri.parse(ApiSettings.attachments.replaceFirst('/{id}', ''));
    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      var attachments = responseJson['data'] as List;
      return attachments.map((e) => Attachment.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<AttachmentType>> getAttachmentTypes() async {
    var url = Uri.parse(ApiSettings.attachmentTypes.replaceFirst('/{id}',''));
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });
    var responseJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var attachmentTypesData = responseJson['data'] as List<dynamic>;
      List<AttachmentType> attachmentTypes = attachmentTypesData
          .map((e) => AttachmentType.fromJson(e as Map<String, dynamic>))
          .toList();
      return attachmentTypes;
    }
    return [];
  }

  Future<AttachmentType> getAttachmentType({required int? id}) async {
    var url  = Uri.parse(ApiSettings.attachmentTypes.replaceFirst('{id}', id.toString()));
    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json'
    });
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      var attachmentType = AttachmentType.fromJson(responseJson['attachment_type']);
      return attachmentType;
    }
    return AttachmentType();
  }


  Future<void> createAttachment({required Attachment attachment,required BuildContext context,required String path,required AddAttachmentCallBack callBack}) async {

    var url  = Uri.parse(ApiSettings.attachmentTypes.replaceFirst('/{id}',''));
      var request = http.MultipartRequest('POST', url);

      http.MultipartFile imageFile = await http.MultipartFile.fromPath('url', path);
      request.fields['info'] = attachment.info!;
      request.fields['name'] = attachment.name!;
      request.fields['date'] = attachment.date!;
      request.fields['status'] = attachment.status!;
      request.fields['reservation_id'] = attachment.reservationId.toString() ;
      request.fields['attachment_type_id'] = attachment.attachmentTypeId.toString();
      request.files.add(imageFile);
      request.headers[HttpHeaders.acceptHeader] = 'application/json';
      request.headers[HttpHeaders.authorizationHeader] = SharedPrefController().token;

      var response = await request.send();
      response.stream.transform(utf8.decoder).listen((event) {
        if (response.statusCode == 201) {
          var jsonResponse = jsonDecode(event);
          callBack(message:jsonResponse['message'],status: true,attachment:jsonResponse['attachment']as Attachment );
        } else if (response.statusCode == 400) {
          var jsonResponse = jsonDecode(event);
          callBack(message:jsonResponse['message'],status: false,);
        } else if (response.statusCode == 500) {
          var jsonResponse = jsonDecode(event);
          callBack(message:jsonResponse['message'],status: false,);
        }
      });
  }

  Future<bool> deleteAttachment({required BuildContext context , required int id})async{
    var url  = Uri.parse(ApiSettings.attachments.replaceFirst('{id}',id.toString()));
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