import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_force_directed_graph/widget/force_directed_graph_widget.dart';
import 'package:projac_mobile/app/_widgets/graph/graph_controller.dart';
import 'package:projac_mobile/routes.g.dart';
import 'package:routefly/routefly.dart';

class GraphVisualization extends StatelessWidget {
  const GraphVisualization({
    required this.graphController,
    super.key,
    this.interactive = true,
    this.maxNodes,
    this.backgroundColor = Colors.transparent,
  });
  final GraphController graphController;
  final bool interactive;
  final int? maxNodes;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          graphController.constraints = constraints;

          return ForceDirectedGraphWidget(
            controller: graphController.controller,
            cachePaintOffset: MediaQuery.of(context).size.height,
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
                color: Theme.of(context).colorScheme.onSurface.withOpacity(.8),
                height: .5,
                width: distance,
              );
            },
          );
        },
      ),
    );
  }
}
