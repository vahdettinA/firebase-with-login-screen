import 'package:flutter/material.dart';
import 'package:loginscreen/theme/mytheme.dart';

class MyTextfield extends StatelessWidget {
  String hintext;
  IconData icon;
  bool obscuretext;
  TextEditingController controller;

  MyTextfield(
      {super.key,
      required this.hintext,
      required this.icon,
      required this.obscuretext,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscuringCharacter: '*',
      textInputAction: TextInputAction.next,
      cursorColor: MyTheme.textColor,
      style: TextStyle(color: MyTheme.textColor2),
      obscureText: obscuretext,
      controller: controller,
      decoration: InputDecoration(
          fillColor: MyTheme.textfieldColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  width: 2,
                  color: MyTheme.textfieldColor,
                  style: BorderStyle.solid)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  width: 2,
                  color: MyTheme.textfieldColor,
                  style: BorderStyle.solid)),
          hintText: hintext,
          prefixIcon: Icon(
            icon,
            color: MyTheme.textColor2,
          ),
          hintStyle: TextStyle(
            color: MyTheme.textColor2,
          )),
    );
  }
}
