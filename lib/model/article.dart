class Article {
  late int id;
  late int likeCount;
  late int shareCount;
  late String title;
  late String briefContent;
  late String content;
  late String status;
  late String imageUrl;
  late String dateTime;


  Article();


  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    briefContent = json['brief_content'];
    content = json['content'];
    status = json['status'];
    imageUrl = json['image_url'];
    likeCount = json['like_count'];
    dateTime = json['date_time'];
    shareCount = json['share_count'];
  }


}
