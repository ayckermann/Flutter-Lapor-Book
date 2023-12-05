import 'package:flutter/material.dart';

var primaryColor = const Color(0xffF4A261);
var warningColor = const Color(0xFFE9C46A);
var dangerColor = const Color(0xFFE76F51);
var successColor = const Color(0xFF2A9D8F);
var greyColor = const Color(0xFFAFAFAF);

TextStyle header1 = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
TextStyle header2 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
TextStyle header3 = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

TextStyle headerStyle({int level = 1, bool dark = true}) {
  List<double> levelSize = [30, 24, 20, 14, 12];
  return TextStyle(
      fontSize: levelSize[level - 1],
      fontWeight: FontWeight.bold,
      color: dark ? Colors.black : Colors.white);
}

var buttonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: primaryColor);

InputDecoration customInputDecoration(String hintText, {Widget? suffixIcon}) {
  return InputDecoration(
      hintText: hintText,
      suffixIcon: suffixIcon,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
}
