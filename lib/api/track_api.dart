import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:zema_multimedia/main.dart';

import '../models/track.dart';

Future<List<Track>> getTracks() async {
  final response = await http.get(Uri.parse("${url}tracks"));
  if (response.statusCode == 200) {
    final jsonRes = json.decode(response.body);
    var result = jsonRes["results"] as List;
    var list = result.map<Track>((json) => Track.fromJson(json)).toList();
    return list;
  } else {
    return [];
  }
}
