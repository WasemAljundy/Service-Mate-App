class DataKey {
  late int id;
  late int active;
  late int required;
  late String type;
  late String gender;
  late String info;
  late String createdAt;
  late String updatedAt;
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    visablity = json['visablity'];
    require = json['require'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['required'] = this.required;
    data['type'] = this.type;
    data['gender'] = this.gender;
    data['info'] = this.info;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['visablity'] = this.visablity;
    data['require'] = this.require;
    return data;
  }
}
