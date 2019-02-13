import 'package:flappy_bombs/app.dart';
import 'package:flappy_bombs/di/graph.dart';
import 'package:flappy_bombs/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_politburo/di/env.dart';
import 'package:flutter_politburo/ui/component/di_widget.dart';

void main() async {
  Env env = Env.prod;
  final graph = await GiganteGraph.graph.build(env);
  runApp(ContainerProvider(graph, child: MyApp()));
}
