import 'package:auto_size_text/auto_size_text.dart';
import 'package:flappy_bombs/constants.dart';
import 'package:flappy_bombs/ui/nav.dart';
import 'package:flappy_bombs/ui/routes/routes.dart';
import 'package:flappy_bombs/ui/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:flappy_bombs/data/video/video_entity.dart';

class BrowseCard extends StatelessWidget {
  BrowseCard({Key key, @required this.video, this.shape})
      : assert(video != null),
        super(key: key);

  static const double height = 320.0;
  final VideoResult video;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return SafeArea(
      top: false,
      bottom: false,
      child: Ink(
        padding: const EdgeInsets.all(8.0),
        height: height,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Nav.scaffoldWithDebugDrawer(
                    DetailsScreen(video),
                    title: "Details"),
              ),
            );
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: shape,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // photo and title
                SizedBox(
                  height: 184.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          child: Hero(
                        tag: "$VIDEO_HERO\_${video.id}",
                        child: Image.network(
                          video.image.screenUrl,
                          fit: BoxFit.cover,
                        ),
                      )),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(color: Colors.black38),
                            child: AutoSizeText(
                              video.name,
                              softWrap: true,
                              minFontSize: 12,
                              style: titleStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // description and share/explore buttons
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AutoSizeText(
                      video.deck,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: descriptionStyle.copyWith(color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
