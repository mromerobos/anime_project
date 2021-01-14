import 'package:flutter/material.dart';

///Class used to define some styles and decorations used on the app
class CustomStyle {
  static final whiteOpacityDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white.withOpacity(0.5));

  static final defaultText = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[900]);

  static final defaultTextMin =
      TextStyle(fontSize: 16, color: Colors.blue[900]);

  static final whiteText =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);

  static final whiteTextThin = TextStyle(
      fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white);

  static final InputDecoration inputDecorator = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(color: Colors.white),
    ),
    labelText: 'Enter Anime Name',
    hintText: 'Eg. Naruto, Dragon ball',
    hintStyle:
        CustomStyle.whiteText.apply(color: Colors.white.withOpacity(0.5)),
    labelStyle: CustomStyle.whiteText,
  );
}
