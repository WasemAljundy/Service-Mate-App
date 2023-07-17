import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controllers/article_api_controller.dart';
import 'package:gp_106_flutter_project/api/controllers/category_api_controller.dart';
import 'package:gp_106_flutter_project/model/article.dart';
import 'package:gp_106_flutter_project/model/category.dart';
import 'package:gp_106_flutter_project/screens/articles_details_screen.dart';
import 'package:gp_106_flutter_project/screens/category_details_screen.dart';
import 'package:gp_106_flutter_project/widgets/article_item.dart';
import 'package:gp_106_flutter_project/widgets/card_error.dart';
import 'package:gp_106_flutter_project/widgets/category_item.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: HexColor('#4B989C'),
            borderRadius: const BorderRadiusDirectional.only(
              bottomEnd: Radius.elliptical(200, 40),
              bottomStart: Radius.elliptical(200, 40),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'images/grey_logo.png',
                  fit: BoxFit.cover,
                  width: 250,
                  height: 250,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Categories',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ConstrainedBox(
            constraints: const BoxConstraints(
                minHeight: 10, maxHeight: 170, minWidth: double.infinity),
            child: FutureBuilder<List<Category>>(
              future: CategoryApiController().getCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && snapshot.data != null) {
                  return GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: CategoryItem(snapshot.data![index]),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryDetailsScreen(
                                      snapshot.data![index]),
                                ));
                          },
                        );
                      });
                } else {
                  return const CardError();
                }
              },
            )),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Articles',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<List<Article>>(
          future: ArticleApiController().getArticles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  itemCount: snapshot.data!.length,
                  physics: const NeverScrollableScrollPhysics(),
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
                          ),
                        );
                      },
                      child: ArticleItem(snapshot.data![index])));
            } else {
              return const CardError();
            }
          },
        )
      ],
    );
  }
}
