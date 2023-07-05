class Article {
  late int id;
  late int objectId;
  late int likeCount;
  late int shareCount;
  late String title;
  late String briefContent;
  late String content;
  late String status;
  late String image;
  late String objectType;
  late String dateTime;


  Article();

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    briefContent = json['brief_content'];
    content = json['content'];
    status = json['status'];
    image = json['image'];
    objectType = json['object_type'];
    objectId = json['object_id'];
    likeCount = json['like_count'];
    dateTime = json['date_time'];
    shareCount = json['share_count'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['brief_content'] = briefContent;
    data['content'] = content;
    data['status'] = status;
    data['image'] = image;
    data['object_type'] = objectType;
    data['object_id'] = objectId;
    data['like_count'] = likeCount;
    data['date_time'] = dateTime;
    data['share_count'] = shareCount;

    return data;
  }
}
