class Currency {
  late int id;
  late String name;
  late String isoCode;
  late String createdAt;
  late String updatedAt;


  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isoCode = json['iso_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['iso_code'] = this.isoCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
