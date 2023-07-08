import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/article.dart';

class ArticlesDetailsScreen extends StatelessWidget {
  Article article;

  ArticlesDetailsScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColors,
          title: Text('Articles details '),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Image(
                    image: NetworkImage(article.imageUrl),
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            article.title,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 1,
                          ),
                          Spacer(),
                          Text(
                            '${article.likeCount}',
                            style:
                            TextStyle(color: primaryColors, fontSize: 22),
                          ),
                          Icon(
                            Icons.favorite_border_outlined,
                            color: primaryColors,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '${article.shareCount}',
                            style:
                            TextStyle(color: primaryColors, fontSize: 22),
                          ),
                          Icon(
                            Icons.send,
                            color: primaryColors,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('About',
                          style:
                          TextStyle(color: Colors.black54, fontSize: 18)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(article.content,
                          style: TextStyle(color: Colors.grey, fontSize: 16)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
