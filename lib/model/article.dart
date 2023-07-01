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
  late String createdAt;
  late String updatedAt;


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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['brief_content'] = this.briefContent;
    data['content'] = this.content;
    data['status'] = this.status;
    data['image'] = this.image;
    data['object_type'] = this.objectType;
    data['object_id'] = this.objectId;
    data['like_count'] = this.likeCount;
    data['date_time'] = this.dateTime;
    data['share_count'] = this.shareCount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
