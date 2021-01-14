import 'package:anime_project/commons/arguments.dart';
import 'package:anime_project/http/jinkan_api.dart';
import 'package:anime_project/models/anime.dart';
import 'package:anime_project/widgets/anime_wraper.dart';
import 'package:flutter/material.dart';

import 'anime_page.dart';

/// This is a double tab page where you can se a list of airing animes and upcoming animes
class TopPage extends StatefulWidget {
  static const String id = 'top_page';

  TopPage(this.arguments);

  final TopAnimeArguments arguments;

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  JinkanApi jinkan = JinkanApi();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        initialIndex: widget.arguments.index,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('img/image2.png'), fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: TabBar(
              tabs: [
                Tab(text: 'Airing', icon: Icon(Icons.trending_up)),
                Tab(text: 'Upcoming', icon: Icon(Icons.update)),
              ],
            ),
            body: TabBarView(
              children: [
                AnimeWraper(animes: widget.arguments.animeAiring, onTap: onTap),
                AnimeWraper(
                    animes: widget.arguments.animeUpcoming, onTap: onTap),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Callback to navigate when pushing some Anime representation, it does a search call too
  Future<void> onTap(int id) async {
    Anime response = await jinkan.fetchAnime(id);
    Navigator.of(context)
        .pushNamed(AnimePage.id, arguments: AnimeArgument(response));
  }
}
