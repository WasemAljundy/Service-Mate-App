class Experience {
  late int id;
  late int objectId;
  late String experienceName;
  late String fromDate;
  late String toDate;
  late String objectType;



  Experience();

  Experience.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    experienceName = json['experience_name'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    objectType = json['object_type'];
    objectId = json['object_id'];
 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['experience_name'] = experienceName;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['object_type'] = objectType;
    data['object_id'] = objectId;

    return data;
  }
}
