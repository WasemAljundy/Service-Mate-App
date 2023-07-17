class Address {
  late int id;
  late int flatId;
  late int clientId;
  late String name;
  late String building;
  late String primary;
  late String street;


  Address();

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    building = json['building'];
    flatId = json['flat_id'];
    primary = json['primary'];
    street = json['street'];
    clientId = json['client_id'];
 
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['id'] = id;
    data['name'] = name;
    data['building'] = building;
    data['flat_id'] = flatId;
    data['primary'] = primary;
    data['street'] = street;
    data['client_id'] = clientId;
   
    return data;
  }
}
