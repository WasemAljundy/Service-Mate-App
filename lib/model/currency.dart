class Currency {
  late int id;
  late String name;
  late String isoCode;



  Currency();

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isoCode = json['iso_code'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['iso_code'] = isoCode;

    return data;
  }
}
