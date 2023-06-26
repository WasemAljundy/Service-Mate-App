import 'package:flutter/material.dart';
class AppTextFiled extends StatelessWidget {



  final IconData? suffixIcon;
  final String hint;
  final bool obSecureText;
  final Color colorText;
  final TextEditingController controller;
  final String? errorText;
  final TextInputType type;
  final Function()? function;

  AppTextFiled({
    required this.controller,
    required this.hint,
    this.colorText = Colors.black,
    this.type = TextInputType.text,
    this.errorText,
    this.obSecureText = false,
    this.suffixIcon,
    this.function
});






  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      controller: controller,
      keyboardType: type,
      obscureText: obSecureText,
      decoration: InputDecoration(
        constraints: BoxConstraints(
          minHeight: 10,
          maxHeight:errorText != null ?90 : 60,

        ),

        errorBorder: _border(radius: 20, color: Colors.red, width: 2),
        hintText: hint,
        suffixIcon: IconButton(onPressed: function, icon: Icon(suffixIcon)),
        errorText: errorText,
        focusedBorder: _border(radius: 15, color: Colors.blue,width: 2),
        hintStyle: TextStyle(color: Colors.grey[400]),
        border: _border(radius: 15, color: Colors.grey,width: 1),
      ),
    );
  }
  OutlineInputBorder _border({required double radius, required Color color , required double width}){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: color,
          width: width,
        )
    );
  }
}
