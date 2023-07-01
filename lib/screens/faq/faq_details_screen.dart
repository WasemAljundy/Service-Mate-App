import 'package:flutter/material.dart';

import '../../constent.dart';


class FaqDetailsScreen extends StatelessWidget {
  const FaqDetailsScreen({super.key});
  final String question = 'The generated Lorem Ipsum is therefore always free ';
  final String answer = 'Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is text copy that serves to fill a space without saying anything meaningful. Its essentially nonsense text that still gives an idea of what real words will look like in the final product.of what real words will look like in the final product';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: UsedColor.PRIMARY_COLOR,
          title: const  Text('FAQ Details'),
          centerTitle: true,
        ),
        body:SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child:Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 20,
                            width: 45,
                            ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text('Question: ',style: TextStyle(color: Colors.black45,fontSize: 18, fontWeight: FontWeight.bold)),
                      Container(child:
                      Text(question
                          ,style: TextStyle(color: Colors.black54,fontSize: 14))),
                      SizedBox(height: 20,),
                      Text('Answer',style: TextStyle(color: Colors.black54,fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5,),
                      Text(answer,
                          style: TextStyle(color: Colors.grey,fontSize: 14)),

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
