import 'package:anime_project/commons/arguments.dart';
import 'package:anime_project/commons/custom_styles.dart';
import 'package:anime_project/http/jinkan_api.dart';
import 'package:anime_project/models/response_anime.dart';
import 'package:anime_project/models/response_anime_search.dart';
import 'package:anime_project/pages/result_page.dart';
import 'package:anime_project/pages/top_page.dart';
import 'package:anime_project/widgets/home_top_button.dart';
import 'package:flutter/material.dart';

/// This is the first page, here we have a text input and 2 buttons to navigate to other pages of the app
class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  JinkanApi jinkan = JinkanApi();

  Future<ResponseAnimeTop> airingAnimes;
  Future<ResponseAnimeTop> upcomingAnimes;
  Future<ResponseAnimeSearch> searchAnimes;

  @override
  void initState() {
    super.initState();
    airingAnimes = jinkan.fetchTopAiring();
    upcomingAnimes = jinkan.fetchTopUpcoming();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('img/image1.png'), fit: BoxFit.cover)),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Search an Anime'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 8,
                        child: TextField(
                            controller: controller,
                            decoration: CustomStyle.inputDecorator,
                            style: CustomStyle.whiteText),
                      ),
                      Expanded(
                          flex: 2,
                          child: FlatButton(
                              onPressed: () => searchButton(),
                              child: Icon(Icons.search, color: Colors.white)))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () => goToTopAnimes(0),
                      child: HomeTopButton(
                          image: 'img/trending.png', text: 'Top Airing')),
                  GestureDetector(
                    onTap: () => goToTopAnimes(1),
                    child: HomeTopButton(
                        image: 'img/upcoming.png', text: 'Top Upcoming'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //This function gets a list of animes depending on input text and goes to ResultPage
  Future<void> searchButton() async {
    if (controller.text.length > 3) {
      ResponseAnimeSearch searchAnimes =
          await jinkan.fetchAnimesByName(controller.text);
      Navigator.of(context).pushNamed(ResultPage.id,
          arguments: SearchArguments(controller.text, searchAnimes.results));
    }
  }

  //This function gets two lists of animes and goes to TopPage
  Future<void> goToTopAnimes(int index) async {
    ResponseAnimeTop airing = await airingAnimes;
    ResponseAnimeTop upcoming = await upcomingAnimes;
    Navigator.of(context).pushNamed(TopPage.id,
        arguments: TopAnimeArguments(airing.top, upcoming.top, index));
  }
}
