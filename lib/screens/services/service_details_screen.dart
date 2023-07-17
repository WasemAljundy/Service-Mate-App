import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controller/service_api_controller.dart';
import 'package:gp_106_flutter_project/model/service.dart';
import 'package:gp_106_flutter_project/screens/services/service_rule_price_screen.dart';
import 'package:gp_106_flutter_project/screens/services/service_work_time_screen.dart';
import 'package:gp_106_flutter_project/widgets/card_error.dart';
import 'package:gp_106_flutter_project/widgets/service_rule_item.dart';

import '../../constent.dart';

class ServiceDetailsScreen extends StatelessWidget {
  int serviceId;

  ServiceDetailsScreen(this.serviceId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColors,
          title: const Text('Service details'),
          centerTitle: true,
        ),
        body: FutureBuilder<Service>(
          future:
              ServiceApiController().getServiceDetails(serviceId: serviceId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryColors,
                ),
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      snapshot.data!.image,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding: const EdgeInsetsDirectional.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: primaryColors,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('short description: ',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Text(snapshot.data!.shortDescription,
                                      style: TextStyle(
                                          color: primaryColors, fontSize: 16)),
                                  Divider(
                                    height: 1,
                                    color: Colors.grey[250],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.ac_unit,
                                        color: primaryColors,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('long description: ',
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Text(snapshot.data!.longDescription,
                                      style: TextStyle(
                                          color: primaryColors, fontSize: 16)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return ServiceRulePriceScreen(
                                        serviceId: snapshot.data!.id,
                                        serviceRuleID: snapshot
                                            .data!.serviceRules![index].id,
                                      );
                                    },
                                  ));
                                },
                                child: ServiceRuleItem(
                                    serviceRule:
                                        snapshot.data!.serviceRules![index]),
                              );
                            },
                            itemCount: snapshot.data!.serviceRules!.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const CardError();
            }
          },
        ));
  }
}
