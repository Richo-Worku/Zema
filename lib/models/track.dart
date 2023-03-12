import 'package:json_annotation/json_annotation.dart';
part 'track.g.dart';

@JsonSerializable()
class Track {
  int id;
  String? track_name;
  String? track_description;
  String? track_coverImage;
  String? track_audioFile;
  String? artist_name;
  String? album_name;
  String? genre_name;
  int? artist_id;
  int? album_id;
  int? genre_id;

  Track(
      {required this.id,
      this.track_name,
      this.track_description,
      this.track_coverImage,
      this.track_audioFile,
      this.artist_name,
      this.album_name,
      this.genre_name,
      this.artist_id,
      this.album_id,
      this.genre_id});

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
