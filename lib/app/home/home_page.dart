import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/home/graph/graph_card.dart';
import 'package:projac_mobile/app/home/widgets/home_drawer.dart';
import 'package:projac_mobile/routes.g.dart';
import 'package:routefly/routefly.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  static const String title = 'Projac';

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
            child: Text('Bem vindo ao Projac Mobile!'),
          ),
          GraphCard(
            title: 'Pesquisadores',
            subtitle: 'Clique para ver mais detalhes',
            onTap: () {
              Routefly.push<void>(routePaths.graph);
            },
          ),
          // Flexible(
          //     // child: GraphWidget(
          //     //     // interactive: false,
          //     //     ),
          //     ),
        ],
      ),
    );
  }
}
