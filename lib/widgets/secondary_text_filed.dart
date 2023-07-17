import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SecondaryTextFiled extends StatelessWidget {



  final IconData? suffixIcon;
  final String hint;
  final bool obSecureText;
  final Color colorText;
  final TextEditingController controller;
  final String? errorText;
  final TextInputType type;
  final Function()? function;
  final IconData? icon;

  SecondaryTextFiled({
    required this.controller,
    required this.hint,
    this.colorText = Colors.black,
    this.type = TextInputType.text,
    this.errorText,
    this.obSecureText = false,
    this.suffixIcon,
    this.function,
    this.icon
  });






  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      controller: controller,
      keyboardType: type,
      obscureText: obSecureText,
      decoration: InputDecoration(
        //***************************
        contentPadding: EdgeInsets.zero,
        constraints:
        BoxConstraints(maxHeight: errorText == null ? 50 : 75),
        errorText: errorText,
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          color: HexColor('#4B989C'),
          fontSize: 12,
        ),
        hintMaxLines: 1,
        suffixIcon: IconButton(onPressed: function, icon: Icon(suffixIcon) , color: HexColor('#4B989C'),),
        prefixIcon: Icon(icon , color: HexColor('#4B989C'),),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: HexColor('#4B989C'),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        //***************************
         focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: HexColor('#4B989C'),
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade400,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade900,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
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