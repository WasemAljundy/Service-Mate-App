import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/screens/reservations/reservations_status_model.dart';

import '../../constent.dart';
import '../../widgets/app_text_filed.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {


  final List<ReservationsStatus> _status = <ReservationsStatus>[
    const ReservationsStatus(1, 'pending'),
    const ReservationsStatus(2, 'canceled'),
    const ReservationsStatus(3, 'done'),
    const ReservationsStatus(4, 'delayed'),
    const ReservationsStatus(5, 'inProgress'),

  ];
  int? _statusID;
  bool _notificaitons = true;


  String? _gender;
  late final  TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _birthDayEditingController;
  late TapGestureRecognizer tapGestureRecognizer;
  late DateTime _birthday;


  String? _emailErrors;
  String? _passwordErrors;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _birthDayEditingController = TextEditingController();
    tapGestureRecognizer = TapGestureRecognizer();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _birthDayEditingController.dispose();
    tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColors,
          title: Text('Reservations' ,style:
          TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900),
        )),
          backgroundColor: Colors.white,
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            children:[
              const SizedBox(height: 15,),
              Text('Service Name',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 5,),
              AppTextFiled(textFieldEnable: false ,controller: _emailController, hint: 'Service price',errorText: _emailErrors, icon: Icons.live_help),
              const SizedBox(height: 10,),

              Text('  Service price',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 5,),
              AppTextFiled(textFieldEnable: false ,controller: _emailController, hint: 'Service price',errorText: _emailErrors, icon: Icons.price_change),
              const SizedBox(height: 10,),

              Text('  Reservations date',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 5,),
              AppTextFiled(textFieldEnable: false ,controller: _emailController,
                hint: 'Reservations date',
                errorText: _emailErrors,
                type: TextInputType.datetime
                , icon: Icons.date_range),
              const SizedBox(height: 10,),


              Text(' Reservations Start Time',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 5,),
              AppTextFiled(textFieldEnable: false ,controller: _emailController,
                  hint: 'Reservations Start Time',
                  errorText: _emailErrors,
                  type: TextInputType.datetime
                  , icon: Icons.timer),
              const SizedBox(height: 10,),


              Text(' Reservations End Time',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 5,),
              AppTextFiled(textFieldEnable: false ,controller: _emailController,
                  hint: 'Reservations End Time',
                  errorText: _emailErrors,
                  type: TextInputType.datetime
                  , icon: Icons.timer_off_rounded),
              const SizedBox(height: 10,),

              Text('Reservations type',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 5,),
              AppTextFiled(textFieldEnable: false ,controller: _emailController,
                  hint: 'Reservations type',
                  errorText: _emailErrors,
                  type: TextInputType.datetime
                  , icon: Icons.check_circle_outline),
              const SizedBox(height: 10,),

              Text('Reservations status',style: TextStyle(color: Colors.grey),),
              DropdownButton(
                isExpanded: true,
                hint: const Text('Select status'),
                disabledHint: const Text('Selection disabled'),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                iconDisabledColor: Colors.grey.shade300,
                iconEnabledColor: Colors.black,
                borderRadius: BorderRadius.circular(10),
                dropdownColor: Colors.white,
                itemHeight: 48,
                elevation: 3,
                value: _statusID,
                onTap: () {},
                onChanged: _notificaitons? (int? value) {
                  if (value != null) {
                    setState(() => _statusID = value);
                  }
                } : null,
                items: _status
                    .map(
                      (e) => DropdownMenuItem(
                    child: Text(e.name),
                    value: e.id,
                  ),
                )
                    .toList(),
              ),


              Text('Reservations details',style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 5,),
              AppLongTextFiled(textFieldEnable: false ,controller: _emailController, hint: 'Reservations details',errorText: _emailErrors),
              const SizedBox(height: 10,),

              Visibility(visible: false,
                  child: Text('Reservations report',style: TextStyle(color: Colors.grey),)),
              const SizedBox(height: 5,),
              AppLongTextFiled(textFieldEnable: false ,
                  visibility: false,
                  controller: _emailController,
                  hint: 'Reservations report',
                  errorText: _emailErrors),
              const SizedBox(height: 10,),
              const SizedBox(height: 25,),



              ElevatedButton(
                onPressed: (){
                  // perFormRegister();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColors,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize: const Size(double.infinity,50),
                ), child: const  Text('Reservations Confirm',style: TextStyle(fontSize: 20),),
              ),
              const SizedBox(height: 35,),


            ],
          )
      ),
    );


  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),)
        .then((value) {
      setState(() {
        _birthday = value!;
        _birthDayEditingController.text = value.toString();
        print(_birthday.toString());
      });

    });
  }

}



