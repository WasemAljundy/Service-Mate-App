import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController{
  SharedPrefController._internal();
  static final SharedPrefController _instance = SharedPrefController._internal();
  late SharedPreferences preferences;
  factory SharedPrefController(){
    return _instance;
  }

  Future<void> initShared()async{
    preferences = await SharedPreferences.getInstance();
  }


  bool get onBoarding => preferences.getBool(PrefsKey.onBoarding.toString())??false;



  // Future<void> save({required Student student}) async {
  //   await preferences.setBool(PrefsKey.loggedIn.toString(), true);
  //   await preferences.setString(PrefsKey.email.toString(), student.email);
  //   await preferences.setString(PrefsKey.fullName.toString(), student.fullName);
  //   await preferences.setString(PrefsKey.gender.toString(), student.gender);
  //   await preferences.setString(PrefsKey.token.toString(), "Bearer "+student.token);
  // }

  // bool get loggedIn => preferences.getBool(PrefsKey.loggedIn.toString())??false;
  //
  // String get token => preferences.getString(PrefsKey.token.toString())??'';
  //
  // Future<bool> logout() async {
  //     await preferences.remove(PrefsKey.token.name);
  //     return  await preferences.remove(PrefsKey.loggedIn.name);
  // }

  Future<void> saveBoarding() async{
    await preferences.setBool(PrefsKey.onBoarding.name, true);
  }
}

enum PrefsKey{
onBoarding
}