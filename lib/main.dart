import 'package:anime_project/pages/anime_page.dart';
import 'package:anime_project/pages/home_page.dart';
import 'package:anime_project/pages/result_page.dart';
import 'package:anime_project/pages/top_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[900],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        ResultPage.id: (context) =>
            ResultPage(ModalRoute.of(context).settings.arguments),
        TopPage.id: (context) =>
            TopPage(ModalRoute.of(context).settings.arguments),
        AnimePage.id: (context) =>
            AnimePage(ModalRoute.of(context).settings.arguments),
      },
    );
  }
}

/***
 * README.md this file has some references and brief explications
 *
 * I'll will add only brief comments along the code to not saturate the reading
 *
 * I think 'model' package is self explanatory, has all serializable classes used for the API
 *
 * 'widgets' package coled some widgets I used on the app.
 */
