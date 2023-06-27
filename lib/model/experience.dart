class Experience {
  late int id;
  late int objectId;
  late String experienceName;
  late String fromDate;
  late String toDate;
  late String objectType;
  late String createdAt;
  late String updatedAt;



  Experience.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    experienceName = json['experience_name'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    objectType = json['object_type'];
    objectId = json['object_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['experience_name'] = this.experienceName;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['object_type'] = this.objectType;
    data['object_id'] = this.objectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
