import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flappy_bombs/constants.dart';
import 'package:flappy_bombs/data/auth/auth_repository.dart';
import 'package:flappy_bombs/data/video/video_entity.dart';
import 'package:flappy_bombs/entity_factory.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class VideoRepository {
  /// [Client] responsible for making authentication calls
  final http.Client client;

  /// [keystore] the platform specific keystore implementation to handle saving an API token
  final FlutterSecureStorage keystore;

  VideoRepository(this.client, this.keystore);

  Future<VideoEntity> getVideos() async {
    var response = await client.get(await _url("videos"));
    return EntityFactory.generateOBJ<VideoEntity>(jsonDecode(response.body));
  }

  Future<String> _url(String subPath) async {
    var key = await keystore.read(key: API_KEY);
    return "$BASE_URL/$subPath?format=json&api_key=$key";
  }
}
