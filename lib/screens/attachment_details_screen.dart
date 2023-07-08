import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/get/attachment_get_controller.dart';
import 'package:gp_106_flutter_project/model/attachment.dart';
import 'package:gp_106_flutter_project/model/attachment_type.dart';
import 'package:gp_106_flutter_project/widgets/card_error.dart';

class AttachmentDetailsScreen extends StatelessWidget {


  Attachment attachment;

  AttachmentDetailsScreen(this.attachment);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColors,
          title: const  Text('attachment details'),
          centerTitle: true,
        ),
        body:FutureBuilder<AttachmentType>(
          future:AttachmentGetXController.to.getAttachmentSingle(id: attachment.attachmentTypeId ) ,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }else if(snapshot.hasData && snapshot.data != null){
              return  SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                          height: 250,
                          child: Image(
                            width: double.infinity,height: 250,fit: BoxFit.cover,
                            image: NetworkImage(attachment.url??''),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color:primaryColors,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child:IconButton(onPressed: (){}, icon: const Icon(Icons.delete_forever_rounded,size: 30,color: Colors.white,))
                            ,),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Text(attachment.name??'',style: const TextStyle(color: Colors.black87,fontSize: 22,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),maxLines: 1,),
                              const Spacer(),
                              Text(attachment.date??'',style: const TextStyle(fontSize: 12,color: Colors.grey),),
                            ],
                          ),
                          Row(children: [
                            const Text('Type: ',style: TextStyle(color: Colors.black45,fontSize: 16)),
                            Text(snapshot.data!.name,style: const TextStyle(color: Colors.black54,fontSize: 18)),
                            const Spacer(),
                            Text(attachment.status??'',style: TextStyle(fontSize: 14,color:primaryColors),),
                          ],),
                          const SizedBox(height: 20,),
                          const Text('Info',style: TextStyle(color: Colors.black54,fontSize: 18)),
                          const SizedBox(height: 5,),
                          Text(attachment.info??'',style: const TextStyle(color: Colors.grey,fontSize: 16)),

                        ],
                      ),
                    )

                  ],
                ),
              );
            }else{
              return CardError();
            }
          },
        )
    );
  }
}
