import 'package:anime_project/models/anime.dart';
import 'package:anime_project/widgets/anime_min.dart';
import 'package:flutter/material.dart';

/// This class is used to wrap a list of Animes represented by the AnimeMin widget
class AnimeWraper extends StatelessWidget {
  AnimeWraper({Key key, this.animes, this.onTap}) : super(key: key);

  final List<Anime> animes;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    List<AnimeMin> list = List<AnimeMin>();

    animes.forEach((element) {
      list.add(AnimeMin(
        anime: element,
        onTap: onTap,
      ));
    });
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: SingleChildScrollView(
        child: Center(
          child: Wrap(
            spacing: 10,
            runSpacing: 20.0,
            alignment: WrapAlignment.end,
            children: list,
          ),
        ),
      ),
    );
  }
}
