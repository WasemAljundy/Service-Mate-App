class PaymentMethod{
  late int id;
  late String name;
  late String image;


  PaymentMethod({required this.name, required this.image});

  PaymentMethod.fromJson(Map<String , dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }


}