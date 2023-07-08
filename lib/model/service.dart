import 'package:gp_106_flutter_project/model/work_time.dart';

class Service {
  late int id;
  late String name;
  late String shortDescription;
  late String longDescription;
  late String image;
  late int categoryId;
  late List<WorkTime> workTimes;

  Service();

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    image = json['image_url'];
    categoryId = json['category_id'];
    if (json['work_times'] != null) {
      workTimes = [];
      json['work_times'].forEach((v) {
        workTimes.add(WorkTime.fromJson(v));
      });
    }
  }
}
