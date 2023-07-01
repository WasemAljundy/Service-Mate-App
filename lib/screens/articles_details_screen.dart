import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';

class ArticlesDetailsScreen extends StatelessWidget {
  const ArticlesDetailsScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return  Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColors,
            title: Text('Articles details '),
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
                        Image.asset('assets/images/test.jpg',width: double.infinity,height: 250,fit: BoxFit.cover,),
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
                            CircleAvatar(radius: 24,backgroundImage: AssetImage('assets/images/test.jpg',),),
                            SizedBox(width: 10,),
                            Text('Anas Alsafadi',style: TextStyle(color: Colors.black87,fontSize: 22,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),maxLines: 1,),
                            Spacer(),
                            Text('5',style: TextStyle(color: primaryColors,fontSize: 22),),
                            Icon(Icons.favorite_border_outlined,color: primaryColors,),
                            SizedBox(width: 15,),
                            Text('7',style: TextStyle(color: primaryColors,fontSize: 22),),
                            Icon(Icons.send,color: primaryColors,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text('About',style: TextStyle(color: Colors.black54,fontSize: 18)),
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
