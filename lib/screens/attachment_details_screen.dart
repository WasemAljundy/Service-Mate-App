import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';

class AttachmentDetailsScreen extends StatelessWidget {
  const AttachmentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColors,
          title: const  Text('attachment details'),
          centerTitle: true,
        ),
        body:SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  child:Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Image.asset('images/test.jpg',width: double.infinity,height: 250,fit: BoxFit.cover,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color:primaryColors,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child:IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever_rounded,size: 30,color: Colors.white,))
                          ,),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text('Rapid blood test',style: TextStyle(color: Colors.black87,fontSize: 22,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),maxLines: 1,),
                          Spacer(),
                          Text('20 july -05 july',style: TextStyle(fontSize: 12,color: Colors.grey),),
                        ],
                      ),
                      Row(children: [
                        Text('Type: ',style: TextStyle(color: Colors.black45,fontSize: 16)),
                        Text('blood category',style: TextStyle(color: Colors.black54,fontSize: 18)),
                        Spacer(),
                        Text('(Pending...)',style: TextStyle(fontSize: 14,color:primaryColors),),
                      ],),
                      SizedBox(height: 20,),
                      Text('Info',style: TextStyle(color: Colors.black54,fontSize: 18)),
                      SizedBox(height: 5,),
                      Text('Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is text copy that serves to fill a space without saying anything meaningful. Its essentially nonsense text that still gives an idea of what real words will look like in the final product.of what real words will look like in the final product',style: TextStyle(color: Colors.grey,fontSize: 16)),
                      Text('Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is text copy that serves to fill a space without saying anything meaningful. Its essentially nonsense text that still gives an idea of what real words will look like in the final product.of what real words will look like in the final product',style: TextStyle(color: Colors.grey,fontSize: 16)),

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
