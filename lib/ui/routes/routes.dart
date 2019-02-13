import 'package:flappy_bombs/data/video/video_entity.dart';
import 'package:flappy_bombs/di/graph.dart';
import 'package:flappy_bombs/ui/nav.dart';
import 'package:flappy_bombs/ui/screens/auth.dart';
import 'package:flappy_bombs/ui/screens/browse.dart';
import 'package:flappy_bombs/ui/screens/details.dart';
import 'package:flappy_bombs/ui/screens/downloads.dart';
import 'package:flappy_bombs/ui/screens/playback.dart';
import 'package:flappy_bombs/ui/screens/settings.dart';
import 'package:fluro/fluro.dart';
import 'package:fimber/fimber.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_politburo/flutter_politburo.dart';
import 'package:flutter_politburo/ui/component/incubating.dart';
import 'package:flutter_politburo/ui/routes/app_router.dart';

typedef bool RouteVeto(RedirectHandler handler);

class GuardableRouter extends Router {
  final List<RouteVeto> globalRouteGuards = [];

  @override
  RouteMatch matchRoute(BuildContext buildContext, String path,
      {RouteSettings routeSettings,
      TransitionType transitionType,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionsBuilder}) {}
}

mixin RouteInterceptor on Handler {}

mixin PageRouteHandler on Handler {
  Scaffold get scaffold => Scaffold();

  Scaffold wrapInScaffold(BuildContext context, Widget widget,
      {endDrawer: Drawer}) {
    return Scaffold(
      body: widget,
      endDrawer: endDrawer,
    );
  }
}

mixin DebugDrawerContainer on Handler {
  Drawer get getDebugDrawer {
    Fimber.d("${GiganteGraph.graph.debugDrawer}");
    return isInDebugMode ? GiganteGraph.graph.debugDrawer : null;
  }
}

class RedirectHandler extends Handler with RouteInterceptor {}

class NavigationProviderHandler extends Handler with PageRouteHandler {
  NavigationProviderHandler(
      {this.type = HandlerType.function, handlerFunc: HandlerFunc})
      : super(handlerFunc: handlerFunc);
  final HandlerType type;

  @override
  HandlerFunc get handlerFunc {
    return (BuildContext context, Map<String, List<String>> params) {
      return wrapInScaffold(context, super.handlerFunc(context, params));
    };
  }
}

class DebugDrawerHandler extends Handler
    with DebugDrawerContainer, PageRouteHandler {
  DebugDrawerHandler(
      {this.type = HandlerType.function, handlerFunc: HandlerFunc})
      : super(handlerFunc: handlerFunc);
  final HandlerType type;

  @override
  HandlerFunc get handlerFunc {
    return (BuildContext context, Map<String, List<String>> params) {
      Fimber.d("handling route with params [$params]");
      Fimber.d("$handlerFunc");
      return wrapInScaffold(context, super.handlerFunc(context, params),
          endDrawer: this.getDebugDrawer);
    };
  }
}

class GiganteRouter extends AppRouter {
  static GiganteRouter _singleton = GiganteRouter._internal(Router());

  GiganteRouter._internal(Router router) : super(router);

  factory GiganteRouter() => _singleton;

  @override
  Map<String, Handler> routeMap() {
    return {
      "/": incubatingHandler,
      "/intro": incubatingHandler,
      "/auth": authHandler,
      "/browse": browseHandler,
      "/details": detailsHandler,
      "/downloads": downloadsHandler,
      "/playback": playbackHandler,
      "/settings": settingsHandler
    };
  }

  static final incubatingHandler =
      _scaffoldWithDebugDrawer(IncubatingScreen(), "Incubating");

  static final authHandler = _scaffoldWithDebugDrawer(BoxeeAuth(), "Auth");

  static final browseHandler =
      _scaffoldWithDebugDrawer(BrowseScreen(), "Browse");

  static final detailsHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Nav.scaffoldWithDebugDrawer(DetailsScreen(VideoResult()), title: "Details");
  });

  static final downloadsHandler =
      _scaffoldWithDebugDrawer(DownloadsScreen(), "Download");

  static final playbackHandler =
      _scaffoldWithDebugDrawer(PlaybackScreen(), "Playback");

  static final settingsHandler =
      _scaffoldWithDebugDrawer(SettingsScreen(), "Settings");

  static Handler _scaffoldWithDebugDrawer(Widget screen, String title) {
    return Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Nav.scaffoldWithDebugDrawer(screen, title: title);
    });
  }
}
