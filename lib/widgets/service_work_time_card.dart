import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/specialist.dart';
import 'package:gp_106_flutter_project/model/work_time.dart';
import 'package:gp_106_flutter_project/screens/reservations/create_reservation_screen.dart';

class ServiceWorkTimeCard extends StatelessWidget {
  WorkTime workTime;

  ServiceWorkTimeCard({
    super.key,
    required this.workTime,
    required this.serviceId,
    required this.serviceRuleId,
    required this.serviceRulePriceId,
    required this.price,
  });

  final int serviceId;
  int serviceRuleId;
  int serviceRulePriceId;
  int price;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsetsDirectional.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black45, offset: Offset(0, 3), blurRadius: 3),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                      child: Text(
                        "Service specialist:",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    Expanded(child: Text(workTime.specialist!.fullName)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                        child: Text(
                      "Service day            : ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )),
                    Expanded(child: Text(workTime.day)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                        child: Text(
                      "Service start time : ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )),
                    Expanded(child: Text(workTime.fromTime)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                        child: Text(
                      "Service end time  : ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )),
                    Expanded(child: Text(workTime.toTime)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                        child: Text(
                      "Service type          : ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    )),
                    Expanded(child: Text(workTime.type)),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text(
                      'GET APPOINTMENT',
                      style: TextStyle(color: primaryColors, fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateReservationScreen(
                                serviceId: serviceId,
                                serviceRuleId: serviceRuleId,
                                serviceRulePriceId: serviceRulePriceId,
                                price:price,
                                specialistId: workTime.specialist!.id),
                          ));
                    },
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: primaryColors,
                    size: 28,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
