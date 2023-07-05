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
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });

    print(response.statusCode);

    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.body)['client'];
      return Client.fromJson(decodedResponse);
    }
    return Client();
  }

  Future<void> updateClient(BuildContext context,
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

    response.stream.transform(utf8.decoder).listen((event) {
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(event);
        showSnackBar(context: context, message: jsonResponse['message']);
      } else if (response.statusCode == 301) {
        var jsonResponse = jsonDecode(event);
        showSnackBar(
            context: context, message: jsonResponse['message'], error: true);
      } else if (response.statusCode == 400 || response.statusCode == 422) {
        var jsonResponse = jsonDecode(event);
        showSnackBar(
            context: context, message: jsonResponse['message'], error: true);
      } else if (response.statusCode == 500) {
        var jsonResponse = jsonDecode(event);
        showSnackBar(
            context: context, message: jsonResponse['message'], error: true);
      }
    });
  }
}
