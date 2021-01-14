// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anime _$AnimeFromJson(Map<String, dynamic> json) {
  return Anime(
    json['mal_id'] as int,
    json['rank'] as int,
    json['title'] as String,
    json['url'] as String,
    json['image_url'] as String,
    json['synopsis'] as String,
    json['type'] as String,
    json['episodes'] as int,
    json['start_date'] as String,
    json['end_date'] as String,
    json['rating'] as String,
    json['status'] as String,
    json['members'] as int,
    (json['score'] as num)?.toDouble(),
    json['airing'] as bool,
  );
}

Map<String, dynamic> _$AnimeToJson(Anime instance) => <String, dynamic>{
      'mal_id': instance.mal_id,
      'rank': instance.rank,
      'title': instance.title,
      'url': instance.url,
      'image_url': instance.image_url,
      'synopsis': instance.synopsis,
      'type': instance.type,
      'episodes': instance.episodes,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'rating': instance.rating,
      'status': instance.status,
      'members': instance.members,
      'score': instance.score,
      'airing': instance.airing,
    };
