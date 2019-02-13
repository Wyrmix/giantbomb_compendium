import 'package:flutter/material.dart';
import 'package:flutter_politburo/ui/component/incubating.dart';

class PlaybackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: IncubatingScreen(),
      ),
    );
  }
}
