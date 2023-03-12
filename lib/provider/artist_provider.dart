import 'package:flutter/material.dart';

import '../api/artist_api.dart';
import '../models/artist.dart';

class ArtistProvider extends ChangeNotifier {
  List<Artist> _allArtists = [];
  bool isArtistLoading = false;

  List<Artist> get artists => _allArtists;

  Future<List<Artist>> getAllArtists() async {
    isArtistLoading = true;

    _allArtists = await getArtists();
    isArtistLoading = false;
    notifyListeners();
    return _allArtists;
  }
}
