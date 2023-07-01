import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
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
        body: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context,index) =>GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/articles_details_screen');
              },
                child: ArticleItem())
        )
    );
  }
}
