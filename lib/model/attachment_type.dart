class AttachmentType {
  late int id;
  late int active;
  late String name;
  late String iconImage;
  late String date;
  late String status;
  late String visablity;


  AttachmentType();

  AttachmentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    active = json['active'];
    iconImage = json['icon_image'];
    date = json['date'];
    status = json['status'];
    visablity = json['visablity'];
  }





  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['id'] = id;
    data['name'] = name;
    data['active'] = active;
    data['icon_image'] = iconImage;
    data['date'] = date;
    data['status'] = status;
    data['visablity'] = visablity;
    return data;
  }
}
