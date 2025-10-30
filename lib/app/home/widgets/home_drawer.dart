import 'dart:async';

import 'package:acadion/app/_widgets/gradient_icon.dart';
import 'package:acadion/app/_widgets/svg_icon.dart';
import 'package:acadion/core/theme/main_theme.dart';
import 'package:acadion/routes.g.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
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
            child: const Row(
              children: [
                SvgIcon(size: 48, color: Colors.white),
                SizedBox(width: 16),
                Text(
                  'Acadion',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const GradientIcon(Ionicons.folder_open_outline),
            title: const Text('Projetos'),
            onTap: () {
              unawaited(
                Routefly.push<void>(
                  routePaths.projetos.path,
                ),
              );
            },
          ),
          ListTile(
            leading: const GradientIcon(Ionicons.people_outline),
            title: const Text('Pesquisadores'),
            onTap: () {
              unawaited(
                Routefly.push<void>(
                  routePaths.pesquisadores.path,
                ),
              );
            },
          ),
          ListTile(
            leading: const GradientIcon(Ionicons.library_outline),
            title: const Text('Produções Acadêmicas'),
            onTap: () {
              unawaited(
                Routefly.push<void>(
                  routePaths.producoesAcademicas.path,
                ),
              );
            },
          ),
          ListTile(
            leading: const GradientIcon(Ionicons.settings_outline),
            title: const Text('Configurações'),
            onTap: () {
              unawaited(Routefly.push<void>(routePaths.settings));
            },
          ),
        ],
      ),
    );
  }
}
