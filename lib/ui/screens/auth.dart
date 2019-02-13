import 'package:flappy_bombs/constants.dart';
import 'package:flappy_bombs/data/auth/auth_repository.dart';
import 'package:flappy_bombs/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_politburo/ui/component/di_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class BoxeeAuth extends StatefulWidget {
  @override
  _BoxeeAuthState createState() => _BoxeeAuthState();
}

class _BoxeeAuthState extends State<BoxeeAuth> {
  final authCodeController = TextEditingController();

  AuthRepository repository;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final container = ContainerProvider.of(context);
    repository = container<AuthRepository>();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "To enjoy premium videos you must authenticate by visiting the link bellow. Then simply enter the code here and click the button to confirm.",
              style: textTheme.headline,
            ),
          ),
          InkWell(
            child: new Text('Open Browser'),
            onTap: () => _launchURL(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: authCodeController,
            ),
          ),
          RaisedButton(
              child: Text("AUTHENTICATE"),
              onPressed: () {
                repository.storeApiKey(authCodeController.text).then((success) {
                  if (success) {
                    Navigator.of(context).pushReplacementNamed("/browse");
                  } else {
                    Scaffold.of(context).showSnackBar(const SnackBar(
                        content:
                            Text("Could not save API key")));
                  }
                });
              })
        ],
      ),
    );
  }

  _launchURL() async {
    if (await canLaunch(BOXEE_AUTH_URL)) {
      await launch(BOXEE_AUTH_URL);
    } else {
      throw 'Could not launch $BOXEE_AUTH_URL';
    }
  }
}
