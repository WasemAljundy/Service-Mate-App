class Address {
  late int id;
  late int flatId;
  late int clientId;
  late String name;
  late String building;
  late String primary;
  late String street;
  late String createdAt;
  late String updatedAt;

  Address();

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    building = json['building'];
    flatId = json['flat_id'];
    primary = json['primary'];
    street = json['street'];
    clientId = json['client_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['building'] = this.building;
    data['flat_id'] = this.flatId;
    data['primary'] = this.primary;
    data['street'] = this.street;
    data['client_id'] = this.clientId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
