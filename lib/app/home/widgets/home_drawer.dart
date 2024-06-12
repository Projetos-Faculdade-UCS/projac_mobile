import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/gradient_icon.dart';
import 'package:projac_mobile/core/theme/main_theme.dart';
import 'package:projac_mobile/routes.g.dart';
import 'package:routefly/routefly.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: MainTheme.getGradient(Theme.of(context).brightness),
            ),
            child: const Text('Drawer Header'),
          ),
          ListTile(
            leading: const GradientIcon(Ionicons.folder_open_outline),
            title: const Text('Projetos'),
            onTap: () {
              Routefly.push<void>(
                routePaths.projetos.path,
              );
            },
          ),
          ListTile(
            leading: const GradientIcon(Ionicons.people_outline),
            title: const Text('Pesquisadores'),
            onTap: () {
              Routefly.push<void>(
                routePaths.pesquisadores.path,
              );
            },
          ),
          ListTile(
            leading: const GradientIcon(Ionicons.settings_outline),
            title: const Text('Configurações'),
            onTap: () {
              Routefly.push<void>(routePaths.settings);
            },
          ),
        ],
      ),
    );
  }
}
