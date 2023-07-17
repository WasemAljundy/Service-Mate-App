import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controller/contact_us_api_controller.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/contact_us_request.dart';
import 'package:gp_106_flutter_project/model/contact_us_request_reply.dart';
import 'package:gp_106_flutter_project/screens_keys.dart';
import 'package:gp_106_flutter_project/widgets/card_contact_us_reply.dart';
import 'package:gp_106_flutter_project/widgets/card_error.dart';
import 'package:lottie/lottie.dart';

class ContactUsDetails extends StatefulWidget {
  int id;

  ContactUsDetails({required this.id});

  @override
  State<ContactUsDetails> createState() => _ContactUsDetailsState();
}

class _ContactUsDetailsState extends State<ContactUsDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('contact us details'),
          centerTitle: true,
        ),
        body: FutureBuilder<ContactUsRequest>(
          future: ContactUsApiController().contactUsDetails(id: widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'subject : ',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      Text(
                        snapshot.data!.subject,
                        style: TextStyle(color: Colors.black54, fontSize: 22),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'question : ',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      Text(
                        snapshot.data!.message,
                        style: TextStyle(color: Colors.black54, fontSize: 22),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      snapshot.data?.contactUsRequestReplies != null
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return CardContactUsReply(snapshot
                                    .data!.contactUsRequestReplies![index]);
                              },
                              itemCount: snapshot
                                  .data!.contactUsRequestReplies!.length,
                            )
                          : Center(
                              child: Text(
                              'Not Found Any Reply',
                              style: TextStyle(color: Colors.grey),
                            ))
                    ],
                  ),
                ),
              );
            } else {
              return const CardError();
            }
          },
        ));
  }
}



