import 'package:flutter/material.dart';

import '../api/album_api.dart';
import '../models/album.dart';

class AlbumProvider extends ChangeNotifier {
  List<Album> _allAlbums = [];
  bool isAlbumLoading = false;

  List<Album> get albums => _allAlbums;

  Future<List<Album>> getAllAlbums() async {
    isAlbumLoading = true;

    _allAlbums = await getAlbums();
    isAlbumLoading = false;
    notifyListeners();
    return _allAlbums;
  }
}
