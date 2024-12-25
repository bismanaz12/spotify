import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spotify/cons/playlist.dart';

Future<String> getToken(BuildContext context) async {
  var clientId = '80846bfe55954603b3e3febe6e29a5a0';
  var clientSecret = '3258982fb9474592be55a800c2053f1b';

  var bytes = utf8.encode('$clientId:$clientSecret');
  var base64Str = base64.encode(bytes);

  var url = 'https://accounts.spotify.com/api/token';
  var headers = {'Authorization': 'Basic $base64Str'};
  var body = {'grant_type': 'client_credentials'};

  var response = await http.post(Uri.parse(url), headers: headers, body: body);
  String? token;

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    token = data['access_token'];
    log('Token: $token');

    // http.Response response1 = await http.get(
    //     Uri.parse('https://api.spotify.com/v1/me/playlists'),
    //     headers: {'Authorization': 'Bearer $token'});
    // var playlists = jsonDecode(response1.body);
    // log(playlists.toString());
    // log(token);
    // getAndDisplayTracks(token);
    // displayAllTracks(token);
    // chatGptPlay(token, context);
  }
  return token ?? '';
}
