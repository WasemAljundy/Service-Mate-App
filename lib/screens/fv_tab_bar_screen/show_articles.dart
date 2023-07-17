import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controller/article_api_controller.dart';
import 'package:gp_106_flutter_project/model/article.dart';
import 'package:gp_106_flutter_project/screens/articles_details_screen.dart';
import 'package:gp_106_flutter_project/screens_keys.dart';
import 'package:gp_106_flutter_project/widgets/article_item.dart';
import 'package:gp_106_flutter_project/widgets/card_error.dart';

class TapBarArticlesScreen extends StatelessWidget {
  const TapBarArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future:ArticleApiController().getFavoriteArticles(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }else if(snapshot.hasData && snapshot.data!.isNotEmpty){
          return  ListView.builder(
              padding:const  EdgeInsets.all(10),
              itemCount: snapshot.data!.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index) =>GestureDetector(
                child: ArticleItem(snapshot.data![index]),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ArticlesDetailsScreen(snapshot.data![index]),)),
              ),
              );
        }else{
          return  const CardError();
        }
      },
    );
  }
}
