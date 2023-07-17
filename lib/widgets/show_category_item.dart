import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/model/category.dart';

class ShowCategoryItem extends StatelessWidget {
 Category category;


 ShowCategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(category.image,fit: BoxFit.cover,height: 150,width: double.infinity,),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Text(category.name,style: const TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Text(category.description,style: const TextStyle(fontSize: 16,color: Colors.grey),),
            ),
            const SizedBox(height: 10,),
          ],
        )
    );
  }
}
