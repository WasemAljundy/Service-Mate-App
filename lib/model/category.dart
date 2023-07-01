class Category {
  late int id;
  late String name;
  late String description;
  late String image;
  late String createdAt;
  late String updatedAt;


  Category();

  Category.a({
   this.id = 1,
   required this.name,
   required this.description,
   this.createdAt = "0",
   this.updatedAt = "0" ,
   required this.image
    } );

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}