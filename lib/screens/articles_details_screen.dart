import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controllers/favorite_api_controller.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/article.dart';

class ArticlesDetailsScreen extends StatefulWidget {
  Article article;

  ArticlesDetailsScreen(this.article);

  @override
  State<ArticlesDetailsScreen> createState() => _ArticlesDetailsScreenState();
}

class _ArticlesDetailsScreenState extends State<ArticlesDetailsScreen> {


  late bool isFavorite;
  @override
  void initState() {
    super.initState();
    isFavorite = widget.article.favouriteCount==1 ?true:false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColors,
          title: const Text('Articles details '),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image(
                  image: NetworkImage(widget.article.imageUrl),
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  Row(
                    children: [
                      const Expanded(
                        child:  Text(
                          'title',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                        ),
                      ),
                      const Spacer(),
                      IconButton(onPressed: ()async {
                       await FavoriteApiController().createArticleFavorite(articleId: widget.article.id);
                       setState(() {
                         isFavorite = !isFavorite;
                       });
                      }, icon: Icon(isFavorite?Icons.favorite:Icons.favorite_border_outlined,color: primaryColors,)),
                    ],
                  ),
                   Text(
                     widget.article.title,
                     style: const TextStyle(
                         color: Colors.black54,
                         fontSize: 22,
                         fontWeight: FontWeight.bold,
                         overflow: TextOverflow.ellipsis),
                     maxLines: 1,
                   ),
                   const SizedBox(
                     height: 20,
                   ),
                   const Text('About',
                       style:
                       TextStyle(color: Colors.grey, fontSize: 18)),
                   Text(widget.article.content,
                       style: const TextStyle(color: Colors.black54, fontSize: 16)),
                 ],
               ),
             )
            ],
          ),
        ),
    );
  }
}
