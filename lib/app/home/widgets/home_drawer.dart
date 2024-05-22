import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/core/theme/main_theme.dart';
import 'package:projac_mobile/routes.dart';
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
            leading: const Icon(Ionicons.library_outline),
            title: const Text('Projetos'),
            onTap: () {
              Routefly.pushNavigate(routePaths.projetos);
            },
          ),
          ListTile(
            leading: const Icon(Ionicons.settings_outline),
            title: const Text('Configurações'),
            onTap: () {
              Routefly.pushNavigate(routePaths.settings);
            },
          ),
        ],
      ),
    );
  }
}
