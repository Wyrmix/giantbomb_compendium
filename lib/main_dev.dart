import 'package:flappy_bombs/app.dart';
import 'package:flappy_bombs/di/graph.dart';
import 'package:flappy_bombs/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_politburo/di/env.dart';
import 'package:flutter_politburo/flutter_politburo.dart';
import 'package:flutter_politburo/ui/component/di_widget.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

void main() async {
  Stetho.initialize();
  Fimber.plantTree(DebugTree(printTimeType: DebugTree.TIME_ELAPSED));
  Stopwatch stopwatch = new Stopwatch();
  Fimber.i("Creating object graph before app run");
  stopwatch.start();
  Env env = isInDebugMode ? Env.dev : Env.prod;
  final graph = await GiganteGraph().build(env);
  stopwatch.stop();
  Fimber.i(
      "Completed object graph creation in ${stopwatch.elapsedMilliseconds} ms");
  Fimber.i("Graph [$graph]");
  runApp(ContainerProvider(graph, child: MyApp()));
}
