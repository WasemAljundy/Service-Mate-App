class Area {
  late int id;
  late int cityId;
  late String name;
  late String icon;



  Area();

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    icon = json['icon'];
 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['city_id'] = cityId;
    data['icon'] = icon;

    return data;
  }
}
