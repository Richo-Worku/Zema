import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zema_multimedia/main.dart';

import '../models/artist.dart';

Future<List<Artist>> getArtists() async {
  final response = await http.get(Uri.parse("${url}artists"));
  if (response.statusCode == 200) {
    final jsonRes = json.decode(response.body);
    var result = jsonRes["results"] as List;
    var list = result.map<Artist>((json) => Artist.fromJson(json)).toList();
    return list;
  } else {
    return [];
  }
}
