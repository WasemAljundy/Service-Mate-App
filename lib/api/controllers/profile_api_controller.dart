import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/model/client.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class ProfileApiController with Helpers {
  Future<Client> getClient({required String id}) async {
    var url = Uri.parse(ApiSettings.clients.replaceFirst('{id}', id));
    print(url);
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });

    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body)['client'];
      return Client.fromJson(decodedResponse);
    }
    return Client();
  }

  Future<Client?> updateClient(
      {required String id,
      required String fullName,
      required String gender,
      required String mobile,
      required String birthDate,
      required String path}) async {
    var url = Uri.parse(ApiSettings.clients.replaceFirst('{id}', id));
    var request = http.MultipartRequest('POST', url);

    http.MultipartFile imageFile =
        await http.MultipartFile.fromPath('image', path);
    request.fields['_method'] = 'PUT';
    request.fields['fullName'] = fullName;
    request.fields['gender'] = gender;
    request.fields['mobile'] = mobile;
    request.files.add(imageFile);
    request.fields['birthDate'] = birthDate;
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.headers[HttpHeaders.authorizationHeader] =
        SharedPrefController().token;
    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      String body = await response.stream.transform(utf8.decoder).first;
      var jsonResponse = jsonDecode(body);
      return Client.fromJson(jsonResponse['client']);
    }
    return null;
  }
}
