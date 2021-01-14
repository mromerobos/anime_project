// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseAnimeTop _$ResponseAnimeTopFromJson(Map<String, dynamic> json) {
  return ResponseAnimeTop(
    json['request_hash'] as String,
    json['request_cached'] as bool,
    (json['request_cache_expiry'] as num)?.toDouble(),
    (json['top'] as List)
        ?.map(
            (e) => e == null ? null : Anime.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseAnimeTopToJson(ResponseAnimeTop instance) =>
    <String, dynamic>{
      'request_hash': instance.request_hash,
      'request_cached': instance.request_cached,
      'request_cache_expiry': instance.request_cache_expiry,
      'top': instance.top,
    };
