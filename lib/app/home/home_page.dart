import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/home/graph/graph_widget.dart';
import 'package:projac_mobile/app/home/widgets/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  static const String title = 'Projac';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text(title),
      ),
      drawer: HomeDrawer(),
      body: Column(
        children: [
          Center(
            child: Text('Bem vindo ao Projac Mobile!'),
          ),
          Flexible(
            child: GraphWidget(
                // interactive: false,
                ),
          ),
        ],
      ),
    );
  }
}
