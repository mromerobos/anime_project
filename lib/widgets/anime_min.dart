import 'dart:ui';

import 'package:anime_project/commons/custom_styles.dart';
import 'package:anime_project/models/anime.dart';
import 'package:flutter/material.dart';

/// This class represent an Anime summary on the pages where there is a List of Animes
class AnimeMin extends StatelessWidget {
  AnimeMin({Key key, this.anime, this.onTap}) : super(key: key);

  final Function onTap;
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.height * 0.25;
    var height = MediaQuery.of(context).size.height * 0.25;

    return GestureDetector(
      onTap: () => onTap(anime.mal_id),
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(8.0),
        decoration: CustomStyle.whiteOpacityDecoration,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 7,
                child: Image.network(
                  anime.image_url,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                      child:
                          Text(anime.title, style: CustomStyle.defaultTextMin)))
            ],
          ),
        ),
      ),
    );
  }
}
