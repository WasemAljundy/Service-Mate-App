import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/reservation.dart';

class ReservationItem extends StatelessWidget {

  Reservation reservation;

  ReservationItem(this.reservation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsetsDirectional.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  Expanded(child: Text('details : ',style: TextStyle(color: Colors.grey,fontSize: 14),)),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child:Icon(reservation.favouriteCount==1?Icons.favorite:Icons.favorite_border_outlined,color: primaryColors,),
                    ),
                  ),
                ],
              ),

              Text(reservation.details,style: TextStyle(color: primaryColors,fontSize: 16),),
                const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: primaryColors,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Specialist Name:',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),),
                          const SizedBox(
                    width: 40,
                  ),
               Expanded(
                 child: Text(
                            reservation.specialist!.fullName,
                            style:
                                TextStyle(color: primaryColors, fontSize: 14,overflow: TextOverflow.ellipsis),maxLines: 1,),
               ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.account_balance,
                    color: primaryColors,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('payment_rule: ',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Expanded(
                      child: Text(
                          reservation.serviceRule!.paymentRule,
                          style:
                              TextStyle(color: primaryColors, fontSize: 18))),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Divider(
                height: 1,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(
                    Icons.monetization_on_outlined,
                    color: primaryColors,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                      child: Text('price: ',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))),
                  const Spacer(),
                  Expanded(
                    child: Text(
                      '${reservation.price}\$',
                      style: TextStyle(
                        color: primaryColors,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),

            ],
          ),
        ),
      ),
    );
  }
}



