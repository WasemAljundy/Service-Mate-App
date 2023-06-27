class SpecialistService {
  late int id;
  late String startWorkingDate;
  late int specialistId;
  late int serviceId;
  late String createdAt;
  late String updatedAt;



  SpecialistService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startWorkingDate = json['start_working_date'];
    specialistId = json['specialist_id'];
    serviceId = json['service_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_working_date'] = this.startWorkingDate;
    data['specialist_id'] = this.specialistId;
    data['service_id'] = this.serviceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}