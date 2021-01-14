import 'dart:convert';

import 'package:anime_project/models/anime.dart';
import 'package:anime_project/models/response_anime.dart';
import 'package:anime_project/models/response_anime_search.dart';
import 'package:http/http.dart' as http;

/// Class to define all calls to the API Jikan
class JinkanApi {
  // Gets the first page of top animes on airing state of the animelist page
  Future<ResponseAnimeTop> fetchTopAiring() async {
    final response =
        await http.get('https://api.jikan.moe/v3/top/anime/1/airing');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ResponseAnimeTop.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load top airing animes list');
    }
  }

  // Gets the first page of top animes on upcoming state of the animelist page
  Future<ResponseAnimeTop> fetchTopUpcoming() async {
    final response =
        await http.get('https://api.jikan.moe/v3/top/anime/1/upcoming');
    if (response.statusCode == 200) {
      return ResponseAnimeTop.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load top upcoming animes list');
    }
  }

  // Gets the first page of animes corresponding to a given name
  Future<ResponseAnimeSearch> fetchAnimesByName(String name) async {
    final response =
        await http.get('https://api.jikan.moe/v3/search/anime?q=$name');
    if (response.statusCode == 200) {
      return ResponseAnimeSearch.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load animes list');
    }
  }

  // Gets the information about and anime by his id
  Future<Anime> fetchAnime(int id) async {
    final response = await http.get('https://api.jikan.moe/v3/anime/$id');
    if (response.statusCode == 200) {
      return Anime.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load animes list');
    }
  }
}
