import 'package:acadion/app/_widgets/custom_app_bar.dart';
import 'package:acadion/app/_widgets/graph/graph_widget.dart';
import 'package:flutter/material.dart';

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
