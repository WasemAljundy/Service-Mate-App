class Data {
  late int id;
  late int dataKeyId;
  late int objectId;
  late String objectType;
  late String value;
  late String dataType;



  Data();

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectType = json['object_type'];
    objectId = json['object_id'];
    value = json['value'];
    dataType = json['data_type'];
    dataKeyId = json['data_key_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['object_type'] = objectType;
    data['object_id'] = objectId;
    data['value'] = value;
    data['data_type'] = dataType;
    data['data_key_id'] = dataKeyId;

    return data;
  }
}
