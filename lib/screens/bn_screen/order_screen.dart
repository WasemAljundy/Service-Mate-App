import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controller/reservation_api_controller.dart';
import 'package:gp_106_flutter_project/model/reservation.dart';
import 'package:gp_106_flutter_project/screens/reservations/reservation_details_screen.dart';
import 'package:gp_106_flutter_project/widgets/card_error.dart';
import 'package:gp_106_flutter_project/widgets/reservation_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: FutureBuilder<List<Reservation>>(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data != null) {
                return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    itemCount: snapshot.data!.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ReservationDetailsScreen(snapshot.data![index]),
                            )),

                        child:ReservationItem(snapshot.data![index])
                    )
                );
              } else {
                return const CardError();
              }
            },
            future: ReservationApiController().getReservations(),
          ),
        ),
      ),
    );
  }
}
