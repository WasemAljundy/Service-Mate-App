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
          Expanded(
              flex: 2,
              child: Image(
                height: 130,
                fit: BoxFit.cover,
                image: NetworkImage(
                  article.imageUrl,
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 10, end: 10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                          article.title,
                          style: const TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black),
                          maxLines: 1,
                        )),
                        Icon(
                          article.favouriteCount == 1
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: primaryColors,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    article.briefContent,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  Text(
                    article.dateTime,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
