import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';

import '../model/article.dart';

class ArticleItem extends StatelessWidget {

  Article article;

  ArticleItem(this.article);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsetsDirectional.only(bottom: 15),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(flex:2,child: Image(
            height: 130,
            fit: BoxFit.cover,
            image:NetworkImage(article.image,),
          )),
           const SizedBox(width:10,),
          Expanded(flex:3,child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(article.title,style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis,color: Colors.black),maxLines: 1,),
              Text(article.briefContent,style: TextStyle(color: Colors.black54,fontSize: 16,overflow: TextOverflow.ellipsis),maxLines: 1,),
              Text(article.dateTime,style: TextStyle(fontSize: 12,color: Colors.grey,overflow: TextOverflow.ellipsis),maxLines: 1,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('${article.shareCount}',style: TextStyle(color: primaryColors),),
                    const  SizedBox(width: 2,),
                    Icon(Icons.send,color: primaryColors,size: 18,),
                    const   Spacer(),
                    Icon(Icons.favorite_border_outlined,color: primaryColors,size: 18,),
                    const  SizedBox(width: 2,),
                    Text('${article.likeCount}',style: TextStyle(color: primaryColors),)
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}