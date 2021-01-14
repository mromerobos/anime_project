import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'anime.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Anime {
  int mal_id;
  int rank;
  String title;
  String url;
  String image_url;
  String synopsis;
  String type;
  int episodes;
  String start_date;
  String end_date;
  String rating;
  String status;
  int members;
  double score;
  bool airing;

  Anime(
      this.mal_id,
      this.rank,
      this.title,
      this.url,
      this.image_url,
      this.synopsis,
      this.type,
      this.episodes,
      this.start_date,
      this.end_date,
      this.rating,
      this.status,
      this.members,
      this.score,
      this.airing);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$AnimeToJson(this);
}

/***
 *    Body:
    "mal_id": 40356,
    "rank": 1,
    "title": "Tate no Yuusha no Nariagari Season 2",
    "url": "https://myanimelist.net/anime/40356/Tate_no_Yuusha_no_Nariagari_Season_2",
    "image_url": "https://cdn.myanimelist.net/images/anime/1683/109090.jpg?s=de752d1c937446f9cf6e83d2cebd31b9",
    "type": "TV",
    "episodes": null,
    "start_date": "2021",
    "end_date": null,
    "members": 187599,
    "score": 0
 */
