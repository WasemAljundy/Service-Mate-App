class Favourite {
  late int id;
  late String objectType;
  late int objectId;
  late int clientId;
  late String createdAt;
  late String updatedAt;



  Favourite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectType = json['object_type'];
    objectId = json['object_id'];
    clientId = json['client_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object_type'] = this.objectType;
    data['object_id'] = this.objectId;
    data['client_id'] = this.clientId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
