import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/category.dart';
import 'package:gp_106_flutter_project/widgets/category_item.dart';
import 'package:gp_106_flutter_project/widgets/show_category_item.dart';

class CategoryDetailsScreen extends StatelessWidget {

  final Category category;


  CategoryDetailsScreen(this.category);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColors,
          title: Text('Categories details'),
          centerTitle: true,
        ),
        body:SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  child:Image(image: NetworkImage(category.image),width: double.infinity,height: 250,fit: BoxFit.cover,),

                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text(category.name,style: TextStyle(color: Colors.black87,fontSize: 22,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),maxLines: 1,),
                      SizedBox(height: 20,),
                      Text('About',style: TextStyle(color: Colors.black54,fontSize: 18)),
                      SizedBox(height: 5,),
                      Text(category.description,style: TextStyle(color: Colors.grey,fontSize: 16)),

                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}

