class DataKey {
  late int id;
  late int active;
  late int required;
  late String type;
  late String gender;
  late String info;

  late String visablity;
  late String require;


  DataKey();

  DataKey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    required = json['required'];
    type = json['type'];
    gender = json['gender'];
    info = json['info'];
    visablity = json['visablity'];
    require = json['require'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['id'] = id;
    data['active'] = active;
    data['required'] = required;
    data['type'] = type;
    data['gender'] = gender;
    data['info'] = info;
    data['visablity'] = visablity;
    data['require'] = require;
    return data;
  }
}
