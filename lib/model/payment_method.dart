class PaymentMethod {
  late int id;
  late String name;
  late String image;


  PaymentMethod();


  PaymentMethod.a({
    id = 0, required name, required image,
});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;

    return data;
  }
}
