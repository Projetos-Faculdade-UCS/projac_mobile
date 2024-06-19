import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/custom_app_bar.dart';
import 'package:projac_mobile/app/_widgets/graph/graph_widget.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('Graph'),
      ),
      body: GraphWidget(
          // maxNodes: 20,
          ),
    );
  }
}
