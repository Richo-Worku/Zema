import 'package:json_annotation/json_annotation.dart';
part 'album.g.dart';

@JsonSerializable()
class Album {
  int id;
  String? album_name;
  String? album_description;
  String? album_coverImage;
  String? artist_name;

  Album(
      {required this.id,
      this.album_name,
      this.album_description,
      this.album_coverImage,
      this.artist_name});
  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
