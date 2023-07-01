import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/model/category.dart';
import 'package:gp_106_flutter_project/widgets/article_item.dart';
import 'package:gp_106_flutter_project/widgets/category_item.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Category> lists = [
    Category.a(
        name: 'It Manger',
        description: 'descriptoin 1',
        image: 'assets/images/test.jpg'
        ),
    Category.a(
        name: 'It Manger',
        description: 'descriptoin 1',
        image: 'images/test.jpg'),
    Category.a(
        name: 'It Manger',
        description: 'descriptoin 1',
        image: 'images/test.jpg'),
    Category.a(
        name: 'It Manger',
        description: 'descriptoin 1',
        image: 'images/test.jpg'),
    Category.a(
        name: 'It Manger',
        description: 'descriptoin 1',
        image: 'images/test.jpg'),
    Category.a(
        name: 'It Manger',
        description: 'descriptoin 1',
        image: 'images/test.jpg'),
    Category.a(
        name: 'It Manger',
        description: 'descriptoin 1',
        image: 'images/test.jpg'),
  ];

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
                bottomStart: Radius.elliptical(200, 40)),
          ),
          child: Column(
            children: [
              Expanded(
                  child: Image.asset(
                'images/logo.png',
                fit: BoxFit.cover,
                width: 250,
                height: 250,
              )),
              // Text('BEST ONLINE',style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
              // Text('RESERVATIONS',style: TextStyle(fontSize: 35,color: Colors.yellow,fontWeight: FontWeight.bold),),
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
          child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: lists.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => CategoryItem(lists[index])),
        ),
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
        ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => ArticleItem())
      ],
    );
  }
}
