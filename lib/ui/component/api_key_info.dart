import 'package:flappy_bombs/data/auth/auth_repository.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_politburo/ui/component/debug_drawer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiKeyDrawerInfo extends DebugDrawerSection {
  final FlutterSecureStorage keystore;
  final SharedPreferences prefs;

  ApiKeyDrawerInfo(this.keystore, this.prefs);

  @override
  List<Widget> build(BuildContext context) => _apiKeyInfo(context);

  /*
  keystore.write(key: API_KEY, value: authResponse.apiKey);
    prefs.setInt(KEY_EXPIRATION, authResponse.expires);
    Fimber.d("API Key [${authResponse.apiKey}], Expires [${authResponse.expires}]");
   */

  List<Widget> _apiKeyInfo(BuildContext context) {
    final expires = prefs.getInt(KEY_EXPIRATION);

    final List<Widget> widgets = List<Widget>.of([
      StreamBuilder(
        stream: keystore.read(key: API_KEY).asStream(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return ListTile(
            leading: Text(
              "API Key",
              textAlign: TextAlign.center,
            ),
            title: AutoSizeText(
              "${snapshot.data}",
              maxLines: 1,
            ),
            subtitle: AutoSizeText("Expires [${DateTime.fromMillisecondsSinceEpoch(expires)}]", maxLines: 1,),
          );
        },
      ),
    ]);

    return widgets;
  }
}
