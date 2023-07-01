import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15,),
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index) =>Card(
          elevation: 3,
          margin: const EdgeInsetsDirectional.only(bottom: 15),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Specialist Name ',style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis,color: Colors.black),maxLines: 1,),
                    Text('500',style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis,color: primaryColors),maxLines: 1,),
                  ],
                ),
                const Text('service name',style: TextStyle(color: Colors.black87,fontSize: 18),),
                const Divider(),
                const Text('Lorem ipsum is a name for a common type of placeholder text. Also known as filler or dummy text, this is text copy that serves to fill a space without saying anything meaningful. It\'s essentially nonsense text that still gives an idea of what real words will look like in the final product.',style: TextStyle(color: Colors.grey,fontSize: 16),),
              ],
            ),
          ),
        )
    );
  }
}
