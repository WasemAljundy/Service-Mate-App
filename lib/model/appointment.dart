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

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['type'] = type;
    data['status'] = status;
    data['report'] = report;
    data['duration'] = duration;
    data['reservation_id'] = reservationId;

    return data;
  }
}
