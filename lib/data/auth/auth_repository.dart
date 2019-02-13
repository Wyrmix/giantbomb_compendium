import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flappy_bombs/constants.dart';
import 'package:flappy_bombs/data/auth/auth_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String API_KEY = "USER_API_KEY";
const String KEY_EXPIRATION = "EXPIRES";

class AuthRepository {
  /// [Client] responsible for making authentication calls
  final http.Client client;

  /// [keystore] the platform specific keystore implimentation to handle saving an API token
  final FlutterSecureStorage keystore;

  /// [prefs] a wrapper for platform specific key, value storage implimentation
  final SharedPreferences prefs;

  AuthRepository(this.client, this.keystore, this.prefs);

  Future<bool> storeApiKey(String confirmationCode) async {
    var response = await client.get("$API_REQUEST_URL$confirmationCode");

    Map<String, dynamic> map = json.decode(response.body);
    var authResponse = AuthResponse.fromJson(map);
    keystore.write(key: API_KEY, value: authResponse.apiKey);
    prefs.setInt(KEY_EXPIRATION, authResponse.expires);
    Fimber.d("API Key [${authResponse.apiKey}], Expires [${authResponse.expires}]");
    return response.statusCode == 200;
  }

  Future<String> get apiKey => keystore.read(key: API_KEY);

  void dispose() {
    client.close();
  }
}