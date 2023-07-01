import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constent.dart';
import '../../widgets/app_text_filed.dart';

class UpdateExperiencesScreen extends StatefulWidget {
  const UpdateExperiencesScreen({super.key});

  @override
  State<UpdateExperiencesScreen> createState() =>
      _UpdateExperiencesScreenState();
}

class _UpdateExperiencesScreenState extends State<UpdateExperiencesScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _birthDayEditingController;
  late TapGestureRecognizer tapGestureRecognizer;
  late DateTime _birthday;

  String? _emailErrors;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _birthDayEditingController = TextEditingController();
    tapGestureRecognizer = TapGestureRecognizer();
  }

  bool _isSecure = false;

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
            title: Text("Update Experiences Screen"),
            backgroundColor: primaryColors,
          ),
          backgroundColor: Colors.white,
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            children: [
              Center(),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Update Experience',
                style: TextStyle(
                    color: primaryColors,
                    fontSize: 24,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                '  Enter experience name',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 5,
              ),
              AppTextFiled(
                  controller: _emailController,
                  hint: 'experience name',
                  errorText: _emailErrors,
                  icon: Icons.cast_for_education),
              const SizedBox(
                height: 10,
              ),
              Text(
                '  From Date ',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 5,
              ),
              AppTextFiled(
                controller: _emailController,
                hint: 'From Date',
                errorText: _emailErrors,
                // icon: Icons.date_range,
                type: TextInputType.datetime,
                suffixIcon: Icons.date_range,
                function: _showDatePicker,
              ),
              Text(
                'To Date',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 5,
              ),
              AppTextFiled(
                controller: _emailController,
                hint: 'To Date',
                errorText: _emailErrors,
                // icon: Icons.date_range,
                type: TextInputType.datetime,
                suffixIcon: Icons.date_range,
                function: _showDatePicker,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  // perFormRegister();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColors,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Update Experience',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
            ],
          )),
    );
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    ).then((value) {
      setState(() {
        _birthday = value!;
        _birthDayEditingController.text = value.toString();
        print(_birthday.toString());
      });
    });
  }
}
