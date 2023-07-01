import 'package:flutter/material.dart';
import 'package:gp_106_flutter_project/constent.dart';

class TextFieldRefactor extends StatelessWidget {
  const TextFieldRefactor({
    required this.controller,
    required this.prefixIcon,
    required this.label,
    this.type = TextInputType.text,
  });

  final TextEditingController controller;
  final IconData prefixIcon;
  final String label;
  final TextInputType? type ;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
          labelText:label,
          prefixIcon: Icon(prefixIcon,color: primaryColors,),
          labelStyle: TextStyle(color: primaryColors),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade400)),
          focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green))
      ),
    );
  }
}
