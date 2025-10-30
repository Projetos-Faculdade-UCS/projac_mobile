import 'dart:async';

import 'package:acadion/app/_widgets/custom_app_bar.dart';
import 'package:acadion/app/home/graph/graph_card.dart';
import 'package:acadion/app/home/widgets/home_drawer.dart';
import 'package:acadion/routes.g.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  static const String title = 'Acadion';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(title),
      ),
      drawer: const HomeDrawer(),
      body: Column(
        children: [
          const Center(
            child: Text('Bem vindo ao Acadion Mobile!'),
          ),
          GraphCard(
            title: 'Pesquisadores',
            subtitle: 'Clique para ver mais detalhes',
            onTap: () {
              unawaited(Routefly.push<void>(routePaths.graph));
            },
          ),
        ],
      ),
    );
  }
}
