import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_force_directed_graph/flutter_force_directed_graph.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisadores_repository.dart';
import 'package:projac_mobile/core/api/models/pesquisador_detail.dart';

class GraphController implements TickerProvider {
  GraphController({
    this.maxNodes,
  }) {
    controller = ForceDirectedGraphController<PesquisadorDetail>(
      graph: ForceDirectedGraph(
        config: config,
      ),
    );
  }
  late final ForceDirectedGraphController<PesquisadorDetail> controller;
  final int? maxNodes;

  static const config = GraphConfig(
    elasticity: 0.02,
    repulsion: 80,
    repulsionRange: 200,
    damping: 0.9,
    length: 250,
  );

  double get _fitScale {
    final sizeProportion = size.width / size.height;
    final nodeCount = controller.graph.nodes.length;

    // Base scaling factor to adjust the graph's size.
    const baseScalingFactor = 0.025;

    // Minimum scale factor to ensure the graph doesn't become too small.
    final minScaleFactor = controller.minScale * 2;

    // Calculate the scale
    final calculatedScale =
        controller.minScale * (nodeCount * baseScalingFactor / sizeProportion);

    // Ensure the scale does not go below the minimum scale factor
    return calculatedScale < minScaleFactor ? minScaleFactor : calculatedScale;
  }

  BoxConstraints _constraints = const BoxConstraints();

  BoxConstraints get constraints => _constraints;

  set constraints(BoxConstraints value) {
    _constraints = value;
    controller.needUpdate();
  }

  Size get size {
    return Size(
      constraints.maxWidth,
      constraints.maxHeight,
    );
  }

  Future<void> fetchData(PesquisadoresRepository repository) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100), () {});
      final data = await repository.getGraph();
      await _updateGraph(data);
    } finally {
      controller.needUpdate();
    }
  }

  List<Node<PesquisadorDetail>> _getNodes(
    List<PesquisadorDetail> pesquisadores,
  ) {
    return pesquisadores.map((pesquisador) {
      return Node<PesquisadorDetail>(pesquisador);
    }).toList();
  }

  Future<void> _updateGraph(List<PesquisadorDetail> data) async {
    var nodes = _getNodes(data)
      ..sort((a, b) {
        final aRelations = data
            .where(
              (pesquisador) => pesquisador.projetos
                  .any((projeto) => a.data.projetos.contains(projeto)),
            )
            .length;
        final bRelations = data
            .where(
              (pesquisador) => pesquisador.projetos
                  .any((projeto) => b.data.projetos.contains(projeto)),
            )
            .length;
        return bRelations.compareTo(aRelations);
      });

    if (maxNodes != null) {
      nodes = nodes.take(maxNodes!).toList();
    }
    final edgesTuples = _getEdges(nodes);

    const batchSize = 10;
    for (var i = 0; i < nodes.length; i += batchSize) {
      final batch = nodes.skip(i).take(batchSize).toList();
      controller.graph.nodes.addAll(batch);
      await Future.delayed(const Duration(milliseconds: 50), () {});
    }
    controller.needUpdate();

    await Future.delayed(const Duration(milliseconds: 300), () {});

    final scale = _fitScale;
    const duration = Duration(milliseconds: 600);
    final scaleTween = Tween<double>(begin: 1, end: scale);
    final animationController = AnimationController(
      vsync: this,
      duration: duration,
    );
    final animation = scaleTween.animate(animationController);
    animation
      ..addListener(() {
        controller.scale = animation.value;
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.dispose();
        }
      });
    await animationController.forward();
    await Future.delayed(const Duration(milliseconds: 300), () {});

    final now = DateTime.now();
    const edgesBatchSize = 100;
    for (var i = 0; i < edgesTuples.length; i += edgesBatchSize) {
      final batch = edgesTuples.skip(i).take(edgesBatchSize).toList();
      for (final edge in batch) {
        controller.addEdgeByNode(edge[0], edge[1]);
      }
      await Future.delayed(const Duration(milliseconds: 10), () {});
    }

    final elapsed = DateTime.now().difference(now).inMilliseconds;

    print('GRAPH_DEBUG: Edges updated in $elapsed ms');

    controller.needUpdate();
  }

  List<List<Node<PesquisadorDetail>>> _getEdges(
    List<Node<PesquisadorDetail>> nodes,
  ) {
    final edges = <List<Node<PesquisadorDetail>>>[];
    for (var i = 0; i < nodes.length; i++) {
      for (var j = i + 1; j < nodes.length; j++) {
        final commonProjects = nodes[i]
            .data
            .projetos
            .where((project) => nodes[j].data.projetos.contains(project))
            .toList();
        if (commonProjects.isNotEmpty) {
          edges.add([nodes[i], nodes[j]]);
        }
      }
    }
    return edges;
  }

  void dispose() {
    controller.dispose();
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
