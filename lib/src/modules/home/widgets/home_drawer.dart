import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text('Drawer Header'),
          ),
          ListTile(
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
