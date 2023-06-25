import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/model/category.dart';

class CategoryItem extends StatelessWidget {

  Category category;
  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Image.asset(category.image,fit: BoxFit.cover,)),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Text(category.name,style: const TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),),
            ),
            const SizedBox(height: 5,),
          ],
        )
    );
  }
}