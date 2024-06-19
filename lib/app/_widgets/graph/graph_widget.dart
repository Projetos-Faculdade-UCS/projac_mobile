import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_force_directed_graph/flutter_force_directed_graph.dart';
import 'package:projac_mobile/app/pesquisadores/bloc/pesquisadores_repository.dart';
import 'package:projac_mobile/app/pesquisadores/get_it.dart';
import 'package:projac_mobile/core/api/models/pesquisador_detail.dart';
import 'package:projac_mobile/routes.g.dart';
import 'package:routefly/routefly.dart';

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
  late final ForceDirectedGraphController<PesquisadorDetail> controller;
  late final bool _disposeGetIt;
  late final PesquisadoresRepository _repository;

  double get _fitScale => 1 / controller.graph.nodes.length * 1 / 200;

  int? get _maxNodes => widget.maxNodes;

  @override
  void initState() {
    super.initState();
    _disposeGetIt = setupPesquisadoresGetIt();
    _repository = pesquisadoresGetIt.get<PesquisadoresRepository>();
    controller = ForceDirectedGraphController<PesquisadorDetail>(
      graph: ForceDirectedGraph(
        config: const GraphConfig(
          elasticity: 0.01,
          repulsion: 80,
          repulsionRange: 200,
          damping: 0.9,
          length: 250,
        ),
      ),
    );

    _fetchGraphData();
  }

  Future<void> _fetchGraphData() async {
    try {
      await Future.delayed(const Duration(milliseconds: 100), () {});
      final data = await _repository.getGraph();
      await _updateGraph(data);
    } finally {
      setState(() {});
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

    if (_maxNodes != null) {
      nodes = nodes.take(_maxNodes!).toList();
    }
    final edgesTuples = _getEdges(nodes);

    const batchSize = 10;
    for (var i = 0; i < nodes.length; i += batchSize) {
      final batch = nodes.skip(i).take(batchSize).toList();
      controller.graph.nodes.addAll(batch);
      await Future.delayed(const Duration(milliseconds: 50), () {});
    }
    controller.needUpdate();

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

    print('GRAPH_DEBUG: edgesTuples.length: ${edgesTuples.length}');
    const edgesBatchSize = 1000;
    for (var i = 0; i < edgesTuples.length; i += edgesBatchSize) {
      final batch = edgesTuples.skip(i).take(edgesBatchSize).toList();
      for (final edge in batch) {
        controller.addEdgeByNode(edge[0], edge[1]);
        await Future.delayed(const Duration(milliseconds: 5), () {});
      }
    }

    final diff = DateTime.now().difference(now).inMilliseconds;
    print('GRAPH_DEBUG: $diff ms');

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

  // Future<void> _addEdges(
  //   List<Node<PesquisadorDetail>> nodes,
  //   List<Node<PesquisadorDetail>> nodesToCompare,
  //   int batchCount,
  // ) async {
  //   final batchSize = nodes.length;
  //   print('GRAPH_DEBUG: batchSize: $batchSize');
  //   print('GRAPH_DEBUG: nodesToCompare.length: ${nodesToCompare.length}');
  //   var iterations = 0;
  //   if (batchSize >= nodesToCompare.length) {
  //     for (var i = 0; i < nodesToCompare.length; i++) {
  //       for (var j = i + 1; j < nodesToCompare.length; j++) {
  //         iterations++;
  //         final commonProjects = nodesToCompare[i]
  //             .data
  //             .projetos
  //             .where(
  //               (project) => nodesToCompare[j].data.projetos.contains(project),
  //             )
  //             .toList();
  //         if (commonProjects.isNotEmpty) {
  //           await Future.delayed(const Duration(milliseconds: 5), () {
  //             controller.addEdgeByNode(nodesToCompare[i], nodesToCompare[j]);
  //           });
  //         }
  //       }
  //     }
  //     print('GRAPH_DEBUG: $iterations iterations');
  //     return;
  //   }

  //   for (var i = 0; i < nodes.length; i++) {
  //     for (var j = i + batchSize * batchCount; j < nodesToCompare.length; j++) {
  //       iterations++;
  //       final commonProjects = nodes[i]
  //           .data
  //           .projetos
  //           .where(
  //             (project) => nodesToCompare[j].data.projetos.contains(project),
  //           )
  //           .toList();
  //       if (commonProjects.isNotEmpty) {
  //         await Future.delayed(const Duration(milliseconds: 5), () {
  //           controller.addEdgeByNode(nodes[i], nodesToCompare[j]);
  //         });
  //       }
  //     }
  //   }
  //   print('GRAPH_DEBUG: $iterations iterations');
  // }

  @override
  void dispose() {
    disposePesquisadoresGetIt(dispose: _disposeGetIt);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final graph = ColoredBox(
      color: widget.backgroundColor,
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, snapshot) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return ForceDirectedGraphWidget(
                controller: controller,
                cachePaintOffset: controller.graph.nodes.length *
                    MediaQuery.of(context).size.height /
                    2 *
                    400,
                nodesBuilder: (context, data) {
                  return GestureDetector(
                    onTap: () {
                      Routefly.of(context).push(
                        routePaths.pesquisadores.$id.changes({
                          'id': data.id.toString(),
                        }),
                      );
                    },
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        data.fotoPerfil,
                        maxHeight: (constraints.maxHeight / 5).toInt(),
                        maxWidth: (constraints.maxWidth / 5).toInt(),
                      ),
                    ),
                  );
                },
                edgesBuilder: (context, a, b, distance) {
                  return Container(
                    color:
                        Theme.of(context).colorScheme.onSurface.withOpacity(.8),
                    height: .5,
                    width: distance,
                  );
                },
              );
            },
          );
        },
      ),
    );

    return widget.interactive ? graph : IgnorePointer(child: graph);
  }
}
