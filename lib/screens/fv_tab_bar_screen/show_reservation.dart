import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controllers/reservation_api_controller.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/reservation.dart';
import 'package:gp_106_flutter_project/screens/reservations/reservation_details_screen.dart';
import 'package:gp_106_flutter_project/widgets/card_error.dart';
import 'package:gp_106_flutter_project/widgets/reservation_item.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   FutureBuilder<List<Reservation>>(
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const  Center(child: CircularProgressIndicator(),);
        }else if(snapshot.hasData  && snapshot.data != null){
          return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15,),
              itemCount: snapshot.data!.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index) =>GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ReservationDetailsScreen(snapshot.data![index]),)),
                  child: ReservationItem(snapshot.data![index])));
        }else {
          return const CardError();
        }
      },
      future: ReservationApiController().getFavoriteReservations(),
    );
  }
}


