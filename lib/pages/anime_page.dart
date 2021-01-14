import 'dart:developer';

import 'package:anime_project/commons/arguments.dart';
import 'package:anime_project/commons/custom_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimePage extends StatelessWidget {
  static const String id = 'anime_page';

  AnimePage(this.arguments);

  final AnimeArgument arguments;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    log(arguments.anime.toJson().toString());
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('img/image2.png'), fit: BoxFit.cover)),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(arguments.anime.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 5),
                              ),
                              child: Image.network(arguments.anime.image_url,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(width: width * .02),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customRichText(
                                      'Title: ', arguments.anime.title),
                                  SizedBox(height: height * .01),
                                  Row(
                                    children: [
                                      customRichText(
                                          'Score: ',
                                          arguments.anime.score.toString() ??
                                              'undefined'),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: height * .01),
                                  customRichText(
                                      'Members: ',
                                      arguments.anime.members.toString() ??
                                          '0'),
                                  SizedBox(height: height * .01),
                                  customRichText(
                                      'Type: ', arguments.anime.type ?? 'n/c'),
                                  SizedBox(height: height * .01),
                                  customRichText('Status: ',
                                      arguments.anime.status ?? 'n/c'),
                                  SizedBox(height: height * .01),
                                  customRichText('Rating: ',
                                      arguments.anime.rating ?? 'n/c'),
                                  SizedBox(height: height * .01),
                                  customRichText('Rank Position: ',
                                      arguments.anime.rank.toString() ?? 'n/c')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * .01),
                          Text(
                            'Synopsis',
                            textAlign: TextAlign.start,
                            style: CustomStyle.whiteText,
                          ),
                          Container(
                              height: 1,
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              color: Colors.white,
                              width: width),
                          Text(arguments.anime.synopsis ?? '',
                              style: CustomStyle.whiteTextThin)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blue[900],
              width: width,
              margin: EdgeInsets.all(8.0),
              child: FlatButton(
                onPressed: () => _launchURL(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.link, color: Colors.white, size: 20),
                    Text(
                      'Link to MyAnimeList',
                      style: CustomStyle.whiteText,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customRichText(String label, String content) {
    return RichText(
      text: TextSpan(text: label, style: CustomStyle.whiteText, children: [
        TextSpan(text: content, style: CustomStyle.whiteTextThin)
      ]),
    );
  }

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(arguments.anime.url)) {
      await launch(arguments.anime.url);
    } else {
      throw 'Could not launch ${arguments.anime.url}';
    }
  }
}
