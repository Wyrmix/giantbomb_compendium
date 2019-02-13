import 'package:flappy_bombs/constants.dart';
import 'package:flappy_bombs/data/video/video_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_politburo/ui/component/incubating.dart';

class DetailsScreen extends StatelessWidget {
  final VideoResult video;

  DetailsScreen(this.video);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Hero(
            tag: "$VIDEO_HERO\_${video.id}",
            child: Image.network(video.image.screenUrl)),
      ],
    );
  }
}
