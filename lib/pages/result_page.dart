import 'package:anime_project/commons/arguments.dart';
import 'package:anime_project/commons/custom_styles.dart';
import 'package:anime_project/http/jinkan_api.dart';
import 'package:anime_project/models/anime.dart';
import 'package:anime_project/models/response_anime_search.dart';
import 'package:anime_project/pages/anime_page.dart';
import 'package:anime_project/widgets/anime_wraper.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  static const String id = 'result_page';

  ResultPage(this.arguments);

  final SearchArguments arguments;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  JinkanApi jinkan = JinkanApi();

  TextEditingController controller = TextEditingController();
  List<Anime> animes;

  @override
  void initState() {
    super.initState();
    controller.text = widget.arguments.name;
    animes = widget.arguments.animes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('img/image2.png'), fit: BoxFit.cover)),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title:
              TextField(controller: controller, style: CustomStyle.whiteText),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () => research(),
                  child: Icon(
                    Icons.search,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        body: AnimeWraper(animes: animes, onTap: onTap),
      ),
    );
  }

  Future<void> research() async {
    if (controller.text.length > 3) {
      ResponseAnimeSearch response =
          await jinkan.fetchAnimesByName(controller.text);
      setState(() {
        animes = response.results;
      });
    }
  }

  //Callback to navigate when pushing some Anime representation, it does a search call too
  Future<void> onTap(int id) async {
    Anime response = await jinkan.fetchAnime(id);
    Navigator.of(context)
        .pushNamed(AnimePage.id, arguments: AnimeArgument(response));
  }
}
