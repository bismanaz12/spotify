import 'package:flutter/material.dart';
import 'package:spotify/cons/model.dart';

class TracksProvider with ChangeNotifier {
  List<TrackSongs> _tracks = [];
  bool _isLoading = false;

  List<TrackSongs> get tracks => _tracks;
  bool get isLoading => _isLoading;

  void setTracks(List<TrackSongs> tracks) {
    _tracks = tracks;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void clearTracks() {
    _tracks = [];
    notifyListeners();
  }

  void addTrack(TrackSongs track) {
    _tracks.add(track);
    notifyListeners();
  }

  void removeTrack(int index) {
    if (index >= 0 && index < _tracks.length) {
      _tracks.removeAt(index);
      notifyListeners();
    }
  }
}
