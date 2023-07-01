class PaymentMethod {
  late int id;
  late String name;
  late String image;
  late String createdAt;
  late String updatedAt;

  PaymentMethod();


  PaymentMethod.a({
    this.id = 0, required this.name, required this.image, this.createdAt = "0", this.updatedAt = "0"
});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
