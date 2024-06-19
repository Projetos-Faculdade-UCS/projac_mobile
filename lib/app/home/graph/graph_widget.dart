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
  });

  final bool interactive;

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget>
    with TickerProviderStateMixin {
  late final ForceDirectedGraphController<PesquisadorDetail> controller;
  late final bool _disposeGetIt;
  late final PesquisadoresRepository _repository;

  double get _fitScale => 1 / controller.graph.nodes.length * 1 / 200;

  @override
  void initState() {
    super.initState();
    _disposeGetIt = setupPesquisadoresGetIt();
    _repository = pesquisadoresGetIt.get<PesquisadoresRepository>();
    controller = ForceDirectedGraphController<PesquisadorDetail>(
      graph: ForceDirectedGraph(
        config: const GraphConfig(
          elasticity: .1,
          repulsion: 500,
          repulsionRange: 200,
          damping: .3,
          length: 400,
        ),
      ),
    );

    _fetchGraphData();
  }

  Future<void> _fetchGraphData() async {
    try {
      final data = await _repository.getGraph();
      unawaited(_updateGraph(data));
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
    final nodes = _getNodes(data);

    // order nodes by number of relations
    // ignore: cascade_invocations
    nodes.sort((a, b) {
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

    const timeToWaitOnEachNode = 10;
    const timeToWaitOnEachEdge = 2;

    Future<void> batata() async {
      // add nodes every 500ms to avoid UI freeze
      for (var i = 0; i < nodes.length; i++) {
        await Future.delayed(
          const Duration(milliseconds: timeToWaitOnEachNode),
          () {
            controller.graph.nodes.add(nodes[i]);
            controller.needUpdate();
          },
        );
      }
    }

    await batata();

    // scale to fit the nodes in the screen
    final scale = _fitScale;

    // animate the scale
    const duration = Duration(milliseconds: 500);
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
    unawaited(animationController.forward());

    await Future.delayed(const Duration(milliseconds: 600), () {});

    // add edges every 500ms to avoid UI freeze
    for (var i = 0; i < nodes.length; i++) {
      for (var j = i + 1; j < nodes.length; j++) {
        final commonProjects = nodes[i]
            .data
            .projetos
            .where((project) => nodes[j].data.projetos.contains(project))
            .toList();
        if (commonProjects.isNotEmpty) {
          await Future.delayed(
            const Duration(milliseconds: timeToWaitOnEachEdge),
            () {
              controller
                ..addEdgeByNode(
                  nodes[i],
                  nodes[j],
                )
                ..needUpdate();
            },
          );
        }
      }
    }

    controller.needUpdate();
  }

  @override
  void dispose() {
    disposePesquisadoresGetIt(dispose: _disposeGetIt);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final graph = ListenableBuilder(
      listenable: controller,
      builder: (context, snapshot) {
        return ForceDirectedGraphWidget(
          controller: controller,
          cachePaintOffset: controller.graph.nodes.length *
              MediaQuery.of(context).size.height /
              2 *
              400,
          nodesBuilder: (context, data) {
            return InkWell(
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
                ),
              ),
            );
          },
          edgesBuilder: (context, a, b, distance) {
            return Container(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(.8),
              height: .5,
              width: distance,
            );
          },
        );
      },
    );

    return widget.interactive ? graph : IgnorePointer(child: graph);
  }
}
