class Article {
  late int id;
  late String title;
  late String briefContent;
  late String content;
  late String status;
  late String imageUrl;
  late String dateTime;
  late bool isFavourite;
  late int favouriteCount;

  Article();


  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    briefContent = json['brief_content'];
    content = json['content'];
    status = json['status'];
    imageUrl = json['image_url'];
    isFavourite = json['is_favourite'];
    favouriteCount = json['favourite_count'];
    dateTime = json['date_time'];
  }


}
