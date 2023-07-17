import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/api/controllers/reservation_api_controller.dart';
import 'package:gp_106_flutter_project/constent.dart';
import 'package:gp_106_flutter_project/helpers/helpers.dart';
import 'package:gp_106_flutter_project/model/reservation.dart';
import 'package:gp_106_flutter_project/prefs/shared_pref_controller.dart';
import 'package:gp_106_flutter_project/screens/main_screen.dart';
import 'package:gp_106_flutter_project/screens_keys.dart';

class CreateReservationScreen extends StatefulWidget {
  int serviceId;
  int serviceRuleId;
  int serviceRulePriceId;
  int specialistId;
  int price;

  CreateReservationScreen(
      {required this.serviceId,
      required this.serviceRuleId,
      required this.serviceRulePriceId,
      required this.price,
      required this.specialistId});

  @override
  State<CreateReservationScreen> createState() =>
      _CreateReservationScreenState();
}

class _CreateReservationScreenState extends State<CreateReservationScreen>
    with Helpers {
  late TextEditingController _priceController;
  late TextEditingController _detailsController;

  @override
  void initState() {
    super.initState();
    _priceController = TextEditingController();
    _detailsController = TextEditingController();
  }

  @override
  void dispose() {
    _detailsController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Reservation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                'create Reservation',
                style: TextStyle(color: primaryColors, fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _detailsController,
                maxLines: 4,
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Details',
                    labelStyle: TextStyle(color: primaryColors, fontSize: 16),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.green))),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await perFormCreate();
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 22),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  bool checkData() {
    if (_detailsController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
        context: context, message: 'Please Enter Required Data !', error: true);
    return false;
  }

  Future<void> perFormCreate() async {
    if (checkData()) {
      create();
    }
  }

  Future<void> create() async {
    int? id = await ReservationApiController()
        .createReservation(reservation: reservation, context: context);
    print('id is : ${id}');
    if (id != null) {
      Future.delayed(
          const Duration(seconds: 2),
          () => Navigator.popUntil(context,ModalRoute.withName(ScreenKeys.mainScreen)));
    }
  }

  Reservation get reservation {
    Reservation e = Reservation();
    e.price = widget.price;
    e.details = _detailsController.text;
    e.serviceId = widget.serviceId;
    e.serviceRuleId = widget.serviceRuleId;
    e.serviceRulePriceId = widget.serviceRulePriceId;
    e.specialistId = widget.specialistId;
    e.clientId = SharedPrefController().clientID;
    return e;
  }
}
