class WorkTime {
  late int id;
  late int specialistId;
  late int serviceId;
  late String day;
  late String fromTime;
  late String toTime;
  late String type;
 


  WorkTime();

  WorkTime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    type = json['type'];
    specialistId = json['specialist_id'];
    serviceId = json['service_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['day'] = day;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['type'] = type;
    data['specialist_id'] = specialistId;
    data['service_id'] = serviceId;

    return data;
  }
}
