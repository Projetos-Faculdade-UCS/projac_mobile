import 'package:routefly/routefly.dart';

import 'app/app_page.dart' as a0;
import 'app/home/home_page.dart' as a1;
import 'app/settings/settings_page.dart' as a2;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/',
    uri: Uri.parse('/'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.AppPage(),
    ),
  ),
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.HomePage(),
    ),
  ),
  RouteEntity(
    key: '/settings',
    uri: Uri.parse('/settings'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.SettingsPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  home: '/home',
  settings: '/settings',
);
