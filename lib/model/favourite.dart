class Favourite {
  late int id;
  late String objectType;
  late int objectId;
  late int clientId;



  Favourite();

  Favourite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    objectType = json['object_type'];
    objectId = json['object_id'];
    clientId = json['client_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['object_type'] = objectType;
    data['object_id'] = objectId;
    data['client_id'] = clientId;

    return data;
  }
}
