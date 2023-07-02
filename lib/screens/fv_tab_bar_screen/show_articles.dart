import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/widgets/article_item.dart';

class TapBarArticlesScreen extends StatelessWidget {
  const TapBarArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15,),
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index) => ArticleItem()
    );
  }
}
