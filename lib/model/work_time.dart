import 'package:gp_106_flutter_project/model/specialist.dart';

class WorkTime {
  late int id;
  late int specialistId;
  late int serviceId;
  late String day;
  late String fromTime;
  late String toTime;
  late String type;
  late Specialist specialist;



  WorkTime();

  WorkTime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    type = json['type'];
    specialistId = json['specialist_id'];
    serviceId = json['service_id'];
    specialist = Specialist.fromJson(json['specialist']);

  }

}
