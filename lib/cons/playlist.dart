import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart'; // To use the provider
import 'package:spotify/cons/model.dart';
import 'package:spotify/cons/provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
// Import the TrackSongs model
// Import the TracksProvider

Future<void> chatGptPlay(String token, BuildContext context) async {
  final tracksProvider = Provider.of<TracksProvider>(context, listen: false);
  tracksProvider.setLoading(true);

  try {
    final response = await http.get(
      Uri.parse(
          'https://api.spotify.com/v1/playlists/3cEYpjA9oz9GiPac4AsH4n/tracks'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<TrackSongs> tracks = [];

      for (var item in data['items']) {
        try {
          final track = TrackSongs.fromJson(item);
          tracks.add(track);
        } catch (e) {
          print('Error parsing track: $e');
        }
      }

      tracksProvider.setTracks(tracks);
    } else {
      print('Failed to fetch tracks: ${response.statusCode}');
      throw Exception('Failed to fetch tracks');
    }
  } catch (e) {
    print('Error fetching tracks: $e');
    tracksProvider.clearTracks();
  } finally {
    tracksProvider.setLoading(false);
  }
}
