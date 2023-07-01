
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';

class AttachmentsScreen extends StatelessWidget {
  const AttachmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColors,
          title: Text('Attachments'),
          centerTitle: true,
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context,index) =>GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/attachment_details_screen');
                },
                child: Card(
                  elevation: 1,
                  margin: EdgeInsetsDirectional.only(bottom: 15),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rapid blood test',style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis,color: Colors.black45),maxLines: 1,),
                        Text('Pending...',style: TextStyle(color: Colors.black54,fontSize: 16),),
                        Text('20 july -05 july',style: TextStyle(fontSize: 12,color: Colors.grey),),
                      ],
                    ),
                  ),
                )
            )
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/add_attachment_screen');
        },
        backgroundColor: primaryColors,
        child: Icon(Icons.add),
      ),
    );
  }
}
