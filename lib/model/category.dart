class Category {
  late int id;
  late String name;
  late String description;
  late String image;



  Category();

  Category.a({
   this.id = 1,
   required this.name,
   required this.description,
   required this.image
    } );

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}