// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist(
      id: json['id'] as int,
      artist_name: json['artist_name'] as String?,
      artist_description: json['artist_description'] as String?,
      artist_profileImage: json['artist_profileImage'] as String?,
    );

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'id': instance.id,
      'artist_name': instance.artist_name,
      'artist_description': instance.artist_description,
      'artist_profileImage': instance.artist_profileImage,
    };
