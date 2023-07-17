import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controller/favorite_api_controller.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/model/reservation.dart';
import 'package:gp_106_flutter_project/screens/add_attachment_screen.dart';
import 'package:gp_106_flutter_project/screens_keys.dart';

class ReservationDetailsScreen extends StatefulWidget {
  Reservation reservation;

  ReservationDetailsScreen(this.reservation);

  @override
  State<ReservationDetailsScreen> createState() =>
      _ReservationDetailsScreenState();
}

class _ReservationDetailsScreenState extends State<ReservationDetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.reservation.favouriteCount == 1 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColors,
        title: const Text('Reservation details '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: const EdgeInsetsDirectional.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: IconButton(
                            onPressed: () async {
                              await FavoriteApiController()
                                  .createReservationFavorite(
                                      reservationId: widget.reservation.id);
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: primaryColors,
                            ),
                          ),
                        ),
                        const Text(
                          'details:  ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          widget.reservation.details,
                          style: const TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.account_balance_wallet_sharp,
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
                                    widget.reservation.serviceRule!.paymentRule,
                                    style: TextStyle(
                                        color: primaryColors, fontSize: 18))),
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
                            const Text('perform_type: ',
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const Spacer(),
                            Expanded(
                                child: Text(
                                    widget.reservation.serviceRule!.performType,
                                    style: TextStyle(
                                        color: primaryColors, fontSize: 18))),
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
                                child: Text('cost: ',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                            const Spacer(),
                            Expanded(
                                child: Text(
                                    '${widget.reservation.serviceRule!.cost}\$',
                                    style: TextStyle(
                                        color: primaryColors, fontSize: 18))),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
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
                              Icons.location_on,
                              color: primaryColors,
                              size: 22,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                                child: Text('location: ',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Text(
                              widget.reservation.serviceRule!.location,
                              style: TextStyle(
                                  color: primaryColors,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1,
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        widget.reservation.serviceRule!.performType == 'physical'?  Row(
                          children: [
                            Icon(
                              Icons.vertical_align_center,
                              color: primaryColors,
                              size: 22,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                                child: Text('lat: ',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                            const Spacer(),
                            Expanded(
                                child: Text(
                                    '${widget.reservation.serviceRule!.lat}',
                                    style: TextStyle(
                                        color: primaryColors, fontSize: 18))),
                          ],
                        ):SizedBox(height: 0,),
                        const SizedBox(
                          height: 5,
                        ),
                       widget.reservation.serviceRule!.performType == 'physical'? Row(
                          children: [
                            Icon(
                              Icons.horizontal_rule,
                              color: primaryColors,
                              size: 22,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                                child: Text('long: ',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                            const Spacer(),
                            Expanded(
                                child: Text(
                                    '${widget.reservation.serviceRule!.long}',
                                    style: TextStyle(
                                        color: primaryColors, fontSize: 18))),
                          ],
                        ):SizedBox(height: 0,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
