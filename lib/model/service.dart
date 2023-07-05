class Service {
  late int id;
  late String name;
  late String shortDescription;
  late String longDescription;
  late String image;
  late int categoryId;



  Service();

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    image = json['image'];
    categoryId = json['category_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['short_description'] = shortDescription;
    data['long_description'] = longDescription;
    data['image'] = image;
    data['category_id'] = categoryId;

    return data;
  }
}