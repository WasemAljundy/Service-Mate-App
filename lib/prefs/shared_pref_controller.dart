import 'package:gp_106_flutter_project/model/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys{
  onBoarding, loggedIn, fullName, email, gender, mobile, birthDate, image, token, id
}

class SharedPrefController{
  SharedPrefController._internal();
  static final SharedPrefController _instance = SharedPrefController._internal();
  late SharedPreferences _sharedPreferences;
  factory SharedPrefController(){
    return _instance;
  }

  Future<void> initShared()async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }




  Future<void> saveClient({required Client client}) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    await _sharedPreferences.setInt(PrefKeys.id.toString(), client.id!);
    await _sharedPreferences.setString(PrefKeys.email.toString(), client.email!);
    await _sharedPreferences.setString(PrefKeys.fullName.toString(), client.fullName!);
    await _sharedPreferences.setString(PrefKeys.gender.toString(), client.gender!);
    await _sharedPreferences.setString(PrefKeys.mobile.toString(), client.mobile!);
    await _sharedPreferences.setString(PrefKeys.birthDate.toString(), client.birthDate!);
    await _sharedPreferences.setString(PrefKeys.token.toString(), "Bearer ${client.token}");
  }

  bool get loggedIn => _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  int get clientID => _sharedPreferences.getInt(PrefKeys.id.toString()) ?? 0 ;

  String get token => _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';

  String get email => _sharedPreferences.getString(PrefKeys.email.toString()) ?? 'No Email Found';

  String get fullName => _sharedPreferences.getString(PrefKeys.fullName.toString()) ?? 'No Name Found';

  bool get onBoarding => _sharedPreferences.getBool(PrefKeys.onBoarding.toString()) ?? false;


  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

  Future<void> saveBoarding() async{
    await _sharedPreferences.setBool(PrefKeys.onBoarding.toString(), true);
  }

}

