import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constent.dart';
class AppTextFiled extends StatelessWidget {



  final IconData? suffixIcon;
  final String hint;
  final bool obSecureText;
  final Color colorText;
  final TextEditingController controller;
  final String? errorText;
  final TextInputType type;
  final Function()? function;
  final IconData? icon;
  final bool? textFieldEnable;


  AppTextFiled({
    required this.controller,
    required this.hint,
    this.colorText = Colors.black,
    this.type = TextInputType.text,
    this.errorText,
    this.obSecureText = false,
    this.suffixIcon,
    this.function,
    this.icon,
    this.textFieldEnable = true,

});






  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: textFieldEnable,
      minLines: 1,
      controller: controller,
      keyboardType: type,
      obscureText: obSecureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        constraints:
        BoxConstraints(maxHeight: errorText == null ? 50 : 75),
        errorText: errorText,
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          color: UsedColor.PRIMARY_COLOR,
          fontSize: 12,
        ),
        hintMaxLines: 1,
        suffixIcon: IconButton(onPressed: function, icon: Icon(suffixIcon) , color: UsedColor.PRIMARY_COLOR,),
        prefixIcon: Icon(icon , color: UsedColor.PRIMARY_COLOR,),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: UsedColor.PRIMARY_COLOR,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: UsedColor.PRIMARY_COLOR,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: UsedColor.PRIMARY_COLOR,
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




class AppLongTextFiled extends StatelessWidget {



  final IconData? suffixIcon;
  final String hint;
  final bool obSecureText;
  final Color colorText;
  final TextEditingController controller;
  final String? errorText;
  final TextInputType type;
  final Function()? function;
  final IconData? icon;
  final bool? textFieldEnable;
  final bool visibility;


  AppLongTextFiled({
    required this.controller,
    required this.hint,
    this.colorText = Colors.black,
    this.type = TextInputType.text,
    this.errorText,
    this.obSecureText = false,
    this.suffixIcon,
    this.function,
    this.icon,
    this.textFieldEnable = true,
    this.visibility = true,

  });






  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Visibility(
        visible: visibility,
        child: TextField(
          enabled: textFieldEnable ,
          expands: true,
          minLines: null,
          maxLines: null,
          controller: controller,
          keyboardType: type,
          obscureText: obSecureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            constraints:
            BoxConstraints(maxHeight: errorText == null ? 150 : 175),
            errorText: errorText,
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              color: UsedColor.PRIMARY_COLOR,
              fontSize: 12,
            ),
            hintMaxLines: 1,
            suffixIcon: IconButton(onPressed: function, icon: Icon(suffixIcon) , color: UsedColor.PRIMARY_COLOR,),
            prefixIcon: Icon(icon , color: UsedColor.PRIMARY_COLOR,),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: UsedColor.PRIMARY_COLOR,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            //***************************
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: UsedColor.PRIMARY_COLOR,
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
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: UsedColor.PRIMARY_COLOR,
                width: 1,
              ),
            ),
          ),
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
