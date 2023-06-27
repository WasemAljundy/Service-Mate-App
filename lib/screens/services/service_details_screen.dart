import 'package:flutter/material.dart';

import '../../constent.dart';


class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});
  final String ServicImg = 'https://www.shutterstock.com/image-illustration/our-services-writing-3d-render-260nw-1877372119.jpg';
  final String short = 'The generated Lorem Ipsum is therefore always free ';
  final String long = 'Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is text copy that serves to fill a space without saying anything meaningful. Its essentially nonsense text that still gives an idea of what real words will look like in the final product.of what real words will look like in the final product';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColors,
          title: const  Text('Service details'),
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
                        Image.network(ServicImg,
                          width: double.infinity,height: 250,fit: BoxFit.cover,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 45,
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
                      Text('Short Description: ',style: TextStyle(color: Colors.black45,fontSize: 18, fontWeight: FontWeight.bold)),
                      Container(child:
                      Text(short
                          ,style: TextStyle(color: Colors.black54,fontSize: 14))),
                      SizedBox(height: 20,),
                      Text('Long Description',style: TextStyle(color: Colors.black54,fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5,),
                      Text(long,
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
