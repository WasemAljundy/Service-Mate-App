class Attachment {
  late int id;
  late int reservationId;
  late int attachmentTypeId;
  late String name;
  late String url;
  late String info;
  late String date;
  late String status;
  
  Attachment();

  Attachment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    info = json['info'];
    date = json['date'];
    status = json['status'];
    reservationId = json['reservation_id'];
    attachmentTypeId = json['attachment_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['info'] = info;
    data['date'] = date;
    data['status'] = status;
    data['reservation_id'] = reservationId;
    data['attachment_type_id'] = attachmentTypeId;

    return data;
  }
}
