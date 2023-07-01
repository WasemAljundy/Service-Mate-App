import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myText extends StatelessWidget {
  const myText({
    super.key,
    required TextEditingController emailTextController,
    required String? emailError,
  }): _emailTextController = emailTextController, _emailError = emailError;

  final TextEditingController _emailTextController;
  final String? _emailError;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _emailTextController,
      keyboardType: TextInputType.emailAddress,
      textAlignVertical: TextAlignVertical.center,
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.done,
      enabled: true,
      readOnly: false,
      minLines: null,
      maxLines: null,
      expands: true,
      buildCounter: (context,
          {required currentLength, required isFocused, maxLength}) {
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        constraints:
        BoxConstraints(maxHeight: _emailError == null ? 50 : 75),
        errorText: _emailError,
        hintText: 'Email',
        hintMaxLines: 1,
        prefixIcon: Icon(Icons.email, color: Colors.white,),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade100,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
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
}