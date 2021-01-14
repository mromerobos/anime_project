import 'package:anime_project/models/anime.dart';

///Class used to pass arguments to NamedPages
class SearchArguments {
  final List<Anime> animes;
  final String name;

  SearchArguments(this.name, this.animes);
}

class AnimeArgument {
  final Anime anime;

  AnimeArgument(this.anime);
}

class TopAnimeArguments {
  final int index;
  final List<Anime> animeAiring;
  final List<Anime> animeUpcoming;

  TopAnimeArguments(this.animeAiring, this.animeUpcoming, this.index);
}
