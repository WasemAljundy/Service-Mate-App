import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin Helpers{
  void showSnackBar({required BuildContext context , required String message , bool error = false}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: error ? Colors.red:Colors.green,
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsetsDirectional.only(
        start: 30,
        end: 30,
        bottom: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),

      ),
    ));
  }
}