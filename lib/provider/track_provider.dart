import 'package:flutter/material.dart';

import '../api/track_api.dart';
import '../models/track.dart';

class TrackProvider extends ChangeNotifier {
  late List<Track> _allTracks = [];
  bool isTrackLoading = false;

  List<Track> get tracks => _allTracks;

  Future<List<Track>> getAllTracks() async {
    isTrackLoading = true;

    _allTracks = await getTracks();
    isTrackLoading = false;
    notifyListeners();
    return _allTracks;
  }
}
