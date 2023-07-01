class Appointment {
  late int id;
  late int reservationId;
  late String date;
  late String startTime;
  late String endTime;
  late String type;
  late String status;
  late String report;
  late String duration;
  late String createdAt;
  late String updatedAt;


  Appointment();

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    type = json['type'];
    status = json['status'];
    report = json['report'];
    duration = json['duration'];
    reservationId = json['reservation_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['type'] = this.type;
    data['status'] = this.status;
    data['report'] = this.report;
    data['duration'] = this.duration;
    data['reservation_id'] = this.reservationId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
