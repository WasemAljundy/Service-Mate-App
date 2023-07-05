class SpecialistService {
  late int id;
  late String startWorkingDate;
  late int specialistId;
  late int serviceId;
  late String createdAt;
  late String updatedAt;


  SpecialistService();

  SpecialistService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startWorkingDate = json['start_working_date'];
    specialistId = json['specialist_id'];
    serviceId = json['service_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['start_working_date'] = startWorkingDate;
    data['specialist_id'] = specialistId;
    data['service_id'] = serviceId;

    return data;
  }
}