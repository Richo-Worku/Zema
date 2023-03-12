import 'package:json_annotation/json_annotation.dart';
part 'artist.g.dart';

@JsonSerializable()
class Artist {
  int id;
  String? artist_name;
  String? artist_description;
  String? artist_profileImage;

  Artist(
      {required this.id,
      this.artist_name,
      this.artist_description,
      this.artist_profileImage});

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}
