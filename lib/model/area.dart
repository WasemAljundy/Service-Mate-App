class Area {
  late int id;
  late int cityId;
  late String name;
  late String icon;
  late String createdAt;
  late String updatedAt;



  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city_id'] = this.cityId;
    data['icon'] = this.icon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
