import 'dart:async';

import 'package:acadion/app/_widgets/graph/graph_controller.dart';
import 'package:acadion/app/_widgets/graph/graph_visualization.dart';
import 'package:acadion/app/pesquisadores/bloc/pesquisadores_repository.dart';
import 'package:acadion/app/pesquisadores/get_it.dart';
import 'package:flutter/material.dart';

class GraphWidget extends StatefulWidget {
  const GraphWidget({
    super.key,
    this.interactive = true,
    this.maxNodes,
    this.backgroundColor = Colors.transparent,
  });

  final bool interactive;
  final int? maxNodes;
  final Color backgroundColor;

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget>
    with TickerProviderStateMixin {
  late final GraphController graphController;
  late final bool _disposeGetIt;
  late final PesquisadoresRepository _repository;

  @override
  void initState() {
    super.initState();
    _disposeGetIt = setupPesquisadoresGetIt();
    _repository = pesquisadoresGetIt.get<PesquisadoresRepository>();
    graphController = GraphController(
      maxNodes: widget.maxNodes,
    );

    unawaited(graphController.fetchData(_repository));
  }

  @override
  void dispose() {
    graphController.dispose();
    unawaited(disposePesquisadoresGetIt(dispose: _disposeGetIt));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !widget.interactive,
      child: GraphVisualization(
        graphController: graphController,
        interactive: widget.interactive,
        maxNodes: widget.maxNodes,
        backgroundColor: widget.backgroundColor,
      ),
    );
  }
}
