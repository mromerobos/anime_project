import 'dart:ui';

import 'package:anime_project/commons/custom_styles.dart';
import 'package:flutter/material.dart';

/// This class is used to define the two button at the homepage, airing and upcoming categories
class HomeTopButton extends StatelessWidget {
  HomeTopButton({Key key, this.image, this.text}) : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.height * 0.25;
    var height = MediaQuery.of(context).size.height * 0.25;

    return Container(
      width: width,
      height: height,
      decoration: CustomStyle.whiteOpacityDecoration,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              width: width * 0.5,
              height: height * 0.5,
              fit: BoxFit.contain,
            ),
            Text(text, style: CustomStyle.defaultText)
          ],
        ),
      ),
    );
  }
}
