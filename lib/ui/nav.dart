import 'package:flappy_bombs/di/graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_politburo/flutter_politburo.dart';

class Nav {
  static Widget scaffoldWithDebugDrawer(Widget screen, {String title}) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: screen,
      endDrawer:
          isInDebugMode ? Drawer(child: GiganteGraph.graph.debugDrawer) : null,
    );
  }
}
