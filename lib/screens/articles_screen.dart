import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controller/article_api_controller.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/article.dart';
import 'package:gp_106_flutter_project/screens/articles_details_screen.dart';
import 'package:gp_106_flutter_project/screens_keys.dart';
import 'package:gp_106_flutter_project/widgets/article_item.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColors,
          title: Text('Articles'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Article>>(
          future: ArticleApiController().getArticles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data!.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () async {
                        Article article = await ArticleApiController()
                            .showArticles(id: snapshot.data![index].id);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ArticlesDetailsScreen(article),
                            ));
                      },
                      child: ArticleItem(snapshot.data![index])));
            } else {
              return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        color: Colors.grey.shade300,
                        size: 80,
                      ),
                      Text('NO DATA',
                          style:
                          TextStyle(color: Colors.grey.shade300, fontSize: 34)),
                    ],
                  ));
            }
          },
        ));
  }
}
