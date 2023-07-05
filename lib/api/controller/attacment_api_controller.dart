import 'dart:convert';
import 'dart:io';

import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/model/attachment.dart';
import 'package:gp_106_flutter_project/model/attachment_type.dart';
import 'package:http/http.dart' as http;

class AttachmentApiController {


  Future<List<Attachment>> getAttachments() async {
    var url  = Uri.parse(ApiSettings.attachments.replaceFirst('/{id}', ''));
    var response = await http.get(url,headers: {
      HttpHeaders.acceptHeader:'application/json'
    });
    var responseJson = jsonDecode(response.body);
    if(response.statusCode == 200){
      var attachments = responseJson['data'] as List;
      return attachments.map((e) => Attachment.fromJson(e)).toList();
    }
    return [];
  }

  Future<AttachmentType> getAttachmentType({required int id}) async {
    var url  = Uri.parse(ApiSettings.attachment_types.replaceFirst('{id}', id.toString()));
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







}