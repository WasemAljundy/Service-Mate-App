import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsetsDirectional.only(bottom: 15),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(flex:2,child: Image.asset('images/test.jpg',fit:BoxFit.cover,height: 135,)),
          SizedBox(width:10,),
          Expanded(flex:3,child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Anas Alsafadi ',style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis,color: Colors.black),maxLines: 1,),
              Text('health',style: TextStyle(color: Colors.black54,fontSize: 16),),
              Text('20 july -05 july',style: TextStyle(fontSize: 12,color: Colors.grey),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('7',style: TextStyle(color: primaryColors),),
                    const  SizedBox(width: 2,),
                    Icon(Icons.send,color: primaryColors,size: 18,),
                    const   Spacer(),
                    Icon(Icons.favorite_border_outlined,color: primaryColors,size: 18,),
                    const  SizedBox(width: 2,),
                    Text('5',style: TextStyle(color: primaryColors),)
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}