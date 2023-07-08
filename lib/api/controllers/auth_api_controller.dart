import 'dart:convert';
import 'dart:io';
import 'package:gp_106_flutter_project/api/api_settings.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/model/client.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

typedef CreateCallBack = void Function(
    {required String message,
    required bool status,
   });

class AuthApiController with Helpers {


  Future<void> register(BuildContext context,
      {required Client client,
        required CreateCallBack callBack,
        required String path}) async {
    var url = Uri.parse(ApiSettings.register);
    var request = http.MultipartRequest('POST', url);

    http.MultipartFile imageFile = await http.MultipartFile.fromPath('image', path);
    request.fields['fullName'] = client.fullName!;
    request.fields['email'] = client.email!;
    request.fields['password'] = client.password!;
    request.fields['gender'] = client.gender!;
    request.fields['mobile'] = client.mobile!;
    request.files.add(imageFile);
    request.fields['birthDate'] = client.birthDate!;
    request.headers[HttpHeaders.acceptHeader] = 'application/json';

    var response = await request.send();
    response.stream.transform(utf8.decoder).listen((event) {
      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(event);
        callBack(message:jsonResponse['message'],status: true,);
      } else if (response.statusCode == 301) {
        var jsonResponse = jsonDecode(event);
        callBack(message:jsonResponse['message'],status: false,);
      } else if (response.statusCode == 400) {
        var jsonResponse = jsonDecode(event);
        callBack(message:jsonResponse['message'],status: false,);
      } else if (response.statusCode == 500) {
        var jsonResponse = jsonDecode(event);
        callBack(message:jsonResponse['message'],status: false,);
      }
    });
  }

  Future<bool> login(BuildContext context,
      {required String email, required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200 && context.mounted) {
      var jsonObject = jsonDecode(response.body)['data'];
      Client client = Client.fromJson(jsonObject);
      SharedPrefController().saveClient(client: client);
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
      return false;
    }
    return false;
  }

  Future<bool> logout(BuildContext context) async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
    });

    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      if (context.mounted) {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
        );
      }
      return true;
    }
    return false;
  }

  Future<bool> forgotPassword(BuildContext context,
      {required String email}) async {
    var url = Uri.parse(ApiSettings.forgotPassword);
    var response = await http.post(url, body: {
      'email': email,
    });

    if (response.statusCode == 200 && context.mounted) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else if (response.statusCode == 400 && context.mounted) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    } else {
      showSnackBar(
        context: context,
        message: 'Something went wrong, please try again!',
        error: true,
      );
    }
    return false;
  }

  Future<bool> resetPassword(
    BuildContext context, {
    required String email,
    required String code,
    required String password,
  }) async {
    var url = Uri.parse(ApiSettings.resetPassword);
    var response = await http.post(
      url,
      body: {
        'email': email,
        'code': code,
        'new_password': password,
        'new_password_confirmation': password,
      },
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
      },
    );

    if (response.statusCode == 200 && context.mounted) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    }
    else if (response.statusCode == 400 && context.mounted) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    else if (response.statusCode == 500) {
      showSnackBar(
        context: context,
        message: 'Server Error',
        error: true,
      );
    }
    return false;
  }

  Future<bool> changePassword(
    BuildContext context, {
    required String currentPassword,
    required String newPassword,
  }) async {
    var url = Uri.parse(ApiSettings.changePassword);
    var response = await http.post(
      url,
      body: {
        'current_password': currentPassword,
        'new_password': newPassword,
        'new_password_confirmation': newPassword,
      },
      headers: {
        HttpHeaders.authorizationHeader: SharedPrefController().token,
        HttpHeaders.acceptHeader: 'application/json',
      },
    );

    if (response.statusCode == 200 && context.mounted) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    }
    else if (response.statusCode == 400 && context.mounted) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }
    else if (response.statusCode == 500) {
      showSnackBar(
        context: context,
        message: 'Server Error',
        error: true,
      );
    }
    return false;
  }


}
