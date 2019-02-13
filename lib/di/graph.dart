import 'package:dioc/dioc.dart' as di;
import 'package:dioc/dioc.dart';
import 'package:flappy_bombs/data/auth/auth_repository.dart';
import 'package:flappy_bombs/data/prefs.dart';
import 'package:flappy_bombs/data/video/video_repository.dart';
import 'package:flappy_bombs/ui/component/api_key_info.dart';
import 'package:flappy_bombs/ui/routes/routes.dart';
import 'package:flutter_politburo/di/env.dart';
import 'package:flutter_politburo/ui/routes/app_router.dart';
import 'package:flutter_politburo/ui/component/debug_drawer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_politburo/di/graph.dart';

class GiganteGraph extends DefaultObjectGraph {
  GiganteGraph() {
    ObjectGraph.graph = this;
  }

  static ObjectGraph get graph => ObjectGraph.graph;

  @override
  Future<Container> registerCommonDependencies(Container container) async {
    final prefs = await SharedPreferences.getInstance();

    container
      ..register<http.Client>((c) => http.Client(),
          defaultMode: di.InjectMode.create)
      ..register<AuthRepository>((c) => AuthRepository(
          container<http.Client>(), container<FlutterSecureStorage>(), prefs))
      ..register<FlutterSecureStorage>((c) => FlutterSecureStorage(),
          defaultMode: di.InjectMode.singleton)
      ..register<SharedPreferences>((c) => prefs,
          defaultMode: di.InjectMode.singleton)
      ..register<VideoRepository>((c) => VideoRepository(
          container<http.Client>(), container<FlutterSecureStorage>()));

    return container;
  }

  @override
  Future<Container> registerDevDependencies(Container container) async {
    final apiKeySection = ApiKeyDrawerInfo(
        container<FlutterSecureStorage>(), container<SharedPreferences>());
    final routesSection =
        RouteEntrySection(GiganteRouter().routeMap(), GiganteRouter().router);
    container.register<DebugDrawer>(
        (c) => DebugDrawer([apiKeySection, routesSection]));

    return container;
  }

  @override
  Future<Container> registerTestDependencies(Container container) async {
    var prefs = MockSharedPrefs();

    container
      ..register<FlutterSecureStorage>((c) => new FlutterSecureStorage())
      ..register<SharedPreferences>((c) => prefs);

    return container;
  }

  @override
  Future<Container> build(Env env) => super.build(env);

  @override
  Future<Container> registerProdDependencies(Container container) =>
      super.registerProdDependencies(container);

  @override
  Future<Container> registerMockDependencies(Container container) =>
      super.registerMockDependencies(container);
}
