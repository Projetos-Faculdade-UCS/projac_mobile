import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_force_directed_graph/widget/force_directed_graph_widget.dart';
import 'package:projac_mobile/app/_widgets/graph/graph_controller.dart';
import 'package:projac_mobile/routes.g.dart';
import 'package:routefly/routefly.dart';

class GraphVisualization extends StatelessWidget {
  GraphVisualization({
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
  final ValueNotifier<bool> _isDetailOpened = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final edgeColor = Theme.of(context).colorScheme.primary;

    return ColoredBox(
      color: backgroundColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          graphController.constraints = constraints;

          return ValueListenableBuilder(
            valueListenable: _isDetailOpened,
            builder: (context, isDetailOpened, child) {
              return ForceDirectedGraphWidget(
                controller: graphController.controller,
                cachePaintOffset: isDetailOpened ? 0 : double.infinity,
                nodesBuilder: (context, data) {
                  return GestureDetector(
                    onTap: () async {
                      _isDetailOpened.value = true;
                      await Routefly.push<void>(
                        routePaths.pesquisadores.$id.changes({
                          'id': data.id.toString(),
                        }),
                      );
                      _isDetailOpened.value = false;
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
                  if (isDetailOpened) {
                    return const SizedBox();
                  }
                  return Box(
                    color: edgeColor,
                    // the smaller the visualization, the bigger the edge
                    height: .5 / constraints.maxHeight * distance,
                    width: distance,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
