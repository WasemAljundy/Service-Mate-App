class AttachmentType {
  late int id;
  late int active;
  late String name;
  late String iconImage;
  late String date;
  late String status;
  late String createdAt;
  late String updatedAt;
  late String visablity;



  AttachmentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    active = json['active'];
    iconImage = json['icon_image'];
    date = json['date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    visablity = json['visablity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['active'] = this.active;
    data['icon_image'] = this.iconImage;
    data['date'] = this.date;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['visablity'] = this.visablity;
    return data;
  }
}
