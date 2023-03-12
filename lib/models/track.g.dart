// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      id: json['id'] as int,
      track_name: json['track_name'] as String?,
      track_description: json['track_description'] as String?,
      track_coverImage: json['track_coverImage'] as String?,
      track_audioFile: json['track_audioFile'] as String?,
      artist_name: json['artist_name'] as String?,
      album_name: json['album_name'] as String?,
      genre_name: json['genre_name'] as String?,
      artist_id: json['artist_id'] as int?,
      album_id: json['album_id'] as int?,
      genre_id: json['genre_id'] as int?,
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'id': instance.id,
      'track_name': instance.track_name,
      'track_description': instance.track_description,
      'track_coverImage': instance.track_coverImage,
      'track_audioFile': instance.track_audioFile,
      'artist_name': instance.artist_name,
      'album_name': instance.album_name,
      'genre_name': instance.genre_name,
      'artist_id': instance.artist_id,
      'album_id': instance.album_id,
      'genre_id': instance.genre_id,
    };
