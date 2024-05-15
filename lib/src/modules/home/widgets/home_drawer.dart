import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/src/core/theme/main_theme.dart';

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
            leading: const Icon(Ionicons.settings_outline),
            title: const Text('Settings'),
            onTap: () {
              Modular.to.pushNamed('/settings/');
              Modular.to.pop();
            },
          ),
        ],
      ),
    );
  }
}
