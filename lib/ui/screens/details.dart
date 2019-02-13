import 'package:auto_size_text/auto_size_text.dart';
import 'package:fimber/fimber.dart';
import 'package:flappy_bombs/constants.dart';
import 'package:flappy_bombs/data/video/video_details_entity.dart';
import 'package:flappy_bombs/data/video/video_entity.dart';
import 'package:flappy_bombs/data/video/video_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_politburo/ui/component/di_widget.dart';
import 'package:flutter_politburo/ui/component/incubating.dart';

class DetailsScreen extends StatefulWidget {
  final String guid;

  DetailsScreen(this.guid);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
      stream: videoRepository.getVideoDetails(widget.guid).asStream(),
      builder: (context, snapshot) {
        Fimber.d("snapshot data ${snapshot.data}");

        if (snapshot.hasError) {
          return AutoSizeText(snapshot.error);
        }

        if (snapshot.hasData) {
          var video = snapshot.data as VideoDetailsEntity;
          return _dataView(video);
        }

        return Center(child: CircularProgressIndicator(),);
      },
    );
  }

  Widget _dataView(VideoDetailsEntity video) {
    var duration = Duration(seconds: video.results.lengthSeconds);

    return ListView(
      children: <Widget>[
        Hero(
            tag: "$VIDEO_HERO\_${video.results.id}",
            child: Image.network(video.results.image.screenUrl)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(video.results.name, textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(video.results.deck, textAlign: TextAlign.start,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText("Runtime $duration", textAlign: TextAlign.center,),
            )

          ],
        )
      ],
    );
  }
}
