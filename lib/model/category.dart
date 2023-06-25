class Category{
  late int id;
  late String name;
  late String description;
  late String image;


  Category({required this.name,required this.description, required this.image});

  Category.fromJson(Map<String , dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }


}