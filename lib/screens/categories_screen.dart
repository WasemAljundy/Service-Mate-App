import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/category.dart';
import 'package:gp_106_flutter_project/widgets/category_item.dart';
import 'package:gp_106_flutter_project/widgets/show_category_item.dart';

class CategoryScreen extends StatelessWidget {
   CategoryScreen({Key? key}) : super(key: key);



   List<Category> lists = [
     Category.a(name: 'It Manger', description: 'Lorem ipsum is a name for a common type of placeholder text. Also known as  or dummy text, this is text copy that serves to fill a space without saying anything meaningful.', image: 'assets/images/test.jpg'),
     Category.a(name: 'It Manger', description: 'Lorem ipsum is a name for a common type of placeholder text. Also known as  or dummy text, this is text copy that serves to fill a space without saying anything meaningful.', image: 'assets/images/test.jpg'),
     Category.a(name: 'It Manger', description: 'Lorem ipsum is a name for a common type of placeholder text. Also known as  or dummy text, this is text copy that serves to fill a space without saying anything meaningful.', image: 'assets/images/test.jpg'),
     Category.a(name: 'It Manger', description: 'Lorem ipsum is a name for a common type of placeholder text. Also known as  or dummy text, this is text copy that serves to fill a space without saying anything meaningful.', image: 'assets/images/test.jpg'),
     Category.a(name: 'It Manger', description: 'Lorem ipsum is a name for a common type of placeholder text. Also known as  or dummy text, this is text copy that serves to fill a space without saying anything meaningful.', image: 'assets/images/test.jpg'),
     Category.a(name: 'It Manger', description: 'Lorem ipsum is a name for a common type of placeholder text. Also known as  or dummy text, this is text copy that serves to fill a space without saying anything meaningful.', image: 'assets/images/test.jpg'),
     Category.a(name: 'It Manger', description: 'Lorem ipsum is a name for a common type of placeholder text. Also known as  or dummy text, this is text copy that serves to fill a space without saying anything meaningful.', image: 'assets/images/test.jpg'),
     Category.a(name: 'It Manger', description: 'Lorem ipsum is a name for a common type of placeholder text. Also known as  or dummy text, this is text copy that serves to fill a space without saying anything meaningful.', image: 'assets/images/test.jpg'),
     Category.a(name: 'It Manger', description: 'Lorem ipsum is a name for a common type of placeholder text. Also known as  or dummy text, this is text copy that serves to fill a space without saying anything meaningful.', image: 'assets/images/test.jpg'),
     Category.a(name: 'It Manger', description: 'Lorem ipsum is a name for a common type of placeholder text. Also known as  or dummy text, this is text copy that serves to fill a space without saying anything meaningful.', image: 'assets/images/test.jpg'),
     Category.a(name: 'It Manger', description: 'Lorem ipsum is a name for a common type of placeholder text. Also known as  or dummy text, this is text copy that serves to fill a space without saying anything meaningful.', image: 'assets/images/test.jpg'),
     Category.a(name: 'It Manger', description: 'Lorem ipsum is a name for a common type of placeholder text. Also known as  or dummy text, this is text copy that serves to fill a space without saying anything meaningful.', image: 'assets/images/test.jpg'),
     Category.a(name: 'It Manger', description: 'Lorem ipsum is a name for a common type of placeholder text. Also known as  or dummy text, this is text copy that serves to fill a space without saying anything meaningful.', image: 'assets/images/test.jpg'),
     Category.a(name: 'It Manger', description: 'Lorem ipsum is a name for a common type of placeholder text. Also known as  or dummy text, this is text copy that serves to fill a space without saying anything meaningful.', image: 'assets/images/test.jpg'),
   ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColors,
        title: Text('Categories'),
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: lists.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index) =>ShowCategoryItem(lists[index])
      )
    );
  }
}

