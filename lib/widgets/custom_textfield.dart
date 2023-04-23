import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    this.hintText,
    this.onChanged,
    this.securedText = false,
  });
  String? hintText;
  bool? securedText;

  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: securedText!,
      validator: (value) {
        if (value!.isEmpty) {
          return "Data is required";
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
      ),
    );
  }
}
