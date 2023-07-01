class Data {
  late int id;
  late int dataKeyId;
  late int objectId;
  late String objectType;
  late String value;
  late String dataType;
  late String createdAt;
  late String updatedAt;


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectType = json['object_type'];
    objectId = json['object_id'];
    value = json['value'];
    dataType = json['data_type'];
    dataKeyId = json['data_key_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object_type'] = this.objectType;
    data['object_id'] = this.objectId;
    data['value'] = this.value;
    data['data_type'] = this.dataType;
    data['data_key_id'] = this.dataKeyId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
