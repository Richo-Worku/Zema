// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      id: json['id'] as int,
      album_name: json['album_name'] as String?,
      album_description: json['album_description'] as String?,
      album_coverImage: json['album_coverImage'] as String?,
      artist_name: json['artist_name'] as String?,
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'album_name': instance.album_name,
      'album_description': instance.album_description,
      'album_coverImage': instance.album_coverImage,
      'artist_name': instance.artist_name,
    };
