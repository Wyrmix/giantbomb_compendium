import 'package:flappy_bombs/ui/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
          accentColor: Colors.blueGrey,
          primaryColor: Colors.red,
      ),
      onGenerateRoute: GiganteRouter().router.generator,
    );
  }
}
