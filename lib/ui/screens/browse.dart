import 'package:flappy_bombs/data/video/video_entity.dart';
import 'package:flappy_bombs/data/video/video_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_politburo/ui/component/di_widget.dart';
import 'package:flappy_bombs/ui/component/video_cards.dart';

class BrowseScreen extends StatefulWidget {
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  VideoRepository videoRepository;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final container = ContainerProvider.of(context);
    videoRepository = container<VideoRepository>();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: videoRepository.getVideos().asStream(),
        builder: (BuildContext context, AsyncSnapshot<VideoEntity> snapshot) {
          var widgets = <Widget>[];

          if (snapshot.hasError) {
            widgets.add(Text("Error gettings videos (${snapshot.error})"));
          }

          if (snapshot.hasData) {
            snapshot.data.results.forEach((video) => widgets.add(BrowseCard(video: video)));
          }

          return ListView(children: widgets,);
        });
  }
}
