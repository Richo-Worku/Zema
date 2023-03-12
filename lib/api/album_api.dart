import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zema_multimedia/main.dart';

import '../models/album.dart';

Future<List<Album>> getAlbums() async {
  final response = await http.get(Uri.parse("${url}albums"));
  if (response.statusCode == 200) {
    final jsonRes = json.decode(response.body);
    var result = jsonRes["results"] as List;
    var list = result.map<Album>((json) => Album.fromJson(json)).toList();
    return list;
  } else {
    return [];
  }
}
