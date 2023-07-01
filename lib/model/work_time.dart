class WorkTime {
  late int id;
  late int specialistId;
  late int serviceId;
  late String day;
  late String fromTime;
  late String toTime;
  late String type;
  late String createdAt;
  late String updatedAt;


  WorkTime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    type = json['type'];
    specialistId = json['specialist_id'];
    serviceId = json['service_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['from_time'] = this.fromTime;
    data['to_time'] = this.toTime;
    data['type'] = this.type;
    data['specialist_id'] = this.specialistId;
    data['service_id'] = this.serviceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
