import 'package:routefly/routefly.dart';

import 'app/app_page.dart' as a0;
import 'app/home/home_page.dart' as a1;
import 'app/pesquisadores/[id]_page.dart' as a3;
import 'app/pesquisadores/pesquisadores_page.dart' as a2;
import 'app/projetos/[id]_page.dart' as a6;
import 'app/projetos/projetos_page.dart' as a5;
import 'app/settings/settings_page.dart' as a4;

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
    key: '/pesquisadores',
    uri: Uri.parse('/pesquisadores'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.PesquisadoresPage(),
    ),
  ),
  RouteEntity(
    key: '/pesquisadores/[id]',
    uri: Uri.parse('/pesquisadores/[id]'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.PesquisadorPage(),
    ),
  ),
  RouteEntity(
    key: '/settings',
    uri: Uri.parse('/settings'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a4.SettingsPage(),
    ),
  ),
  RouteEntity(
    key: '/projetos',
    uri: Uri.parse('/projetos'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a5.ProjetosPage(),
    ),
  ),
  RouteEntity(
    key: '/projetos/[id]',
    uri: Uri.parse('/projetos/[id]'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a6.ProjetoPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  home: '/home',
  pesquisadores: (
    path: '/pesquisadores',
    $id: '/pesquisadores/[id]',
  ),
  settings: '/settings',
  projetos: (
    path: '/projetos',
    $id: '/projetos/[id]',
  ),
);
