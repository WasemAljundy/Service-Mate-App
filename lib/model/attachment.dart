class Attachment {
  late int id;
  late int reservationId;
  late int attachmentTypeId;
  late String name;
  late String url;
  late String info;
  late String date;
  late String status;
  late String createdAt;
  late String updatedAt;



  Attachment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    info = json['info'];
    date = json['date'];
    status = json['status'];
    reservationId = json['reservation_id'];
    attachmentTypeId = json['attachment_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['info'] = this.info;
    data['date'] = this.date;
    data['status'] = this.status;
    data['reservation_id'] = this.reservationId;
    data['attachment_type_id'] = this.attachmentTypeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
