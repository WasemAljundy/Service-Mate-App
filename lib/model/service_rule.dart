class ServiceRule {
  late int id;
  late int cost;
  late int lat;
  late int long;
  late int serviceId;
  late int active;
  late String image;
  late String paymentRule;
  late String performType;
  late String location;
  late String createdAt;
  late String updatedAt;


  ServiceRule();

  ServiceRule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    cost = json['cost'];
    paymentRule = json['payment_rule'];
    performType = json['perform_type'];
    active = json['active'];
    location = json['location'];
    lat = json['lat'];
    long = json['long'];
    serviceId = json['service_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['cost'] = this.cost;
    data['payment_rule'] = this.paymentRule;
    data['perform_type'] = this.performType;
    data['active'] = this.active;
    data['location'] = this.location;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['service_id'] = this.serviceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}