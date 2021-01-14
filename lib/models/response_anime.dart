import 'package:anime_project/models/anime.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'response_anime.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class ResponseAnimeTop {
  String request_hash;
  bool request_cached;
  double request_cache_expiry;
  List<Anime> top;

  ResponseAnimeTop(this.request_hash, this.request_cached,
      this.request_cache_expiry, this.top);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory ResponseAnimeTop.fromJson(Map<String, dynamic> json) =>
      _$ResponseAnimeTopFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ResponseAnimeTopToJson(this);
}

/***
    {
    "request_hash": "request:top:6ca7f65d98ad03f12e5c0e7e6fac8e5cfea00e27",
    "request_cached": true,
    "request_cache_expiry": 86307,
    "top": []
    }
 */
