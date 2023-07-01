import 'package:gp_106_flutter_project/api/api_controller/auth.dart';
import 'package:gp_106_flutter_project/api/api_controller/delete.dart';
import 'package:gp_106_flutter_project/api/api_controller/get.dart';
import 'package:gp_106_flutter_project/api/api_controller/insert.dart';
import 'package:gp_106_flutter_project/api/api_controller/update.dart';

class ApiController {
   static AuthApi auth = AuthApi();
   static DeleteApiData delete = DeleteApiData();
   static GetApiData get = GetApiData();
   static InsertApiData insert = InsertApiData();
   static UpdateApiData update = UpdateApiData();


}
