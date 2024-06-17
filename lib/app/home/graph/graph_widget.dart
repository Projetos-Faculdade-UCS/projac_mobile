import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_force_directed_graph/model/graph.dart';
import 'package:flutter_force_directed_graph/widget/force_directed_graph_controller.dart';
import 'package:flutter_force_directed_graph/widget/force_directed_graph_widget.dart';
import 'package:projac_mobile/routes.g.dart';
import 'package:routefly/routefly.dart';

class GraphWidget extends StatefulWidget {
  const GraphWidget({super.key});

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  late final controller = ForceDirectedGraphController<int>(
    graph: ForceDirectedGraph.generateNTree(
      nodeCount: 5,
      maxDepth: 3,
      n: 4,
      generator: () {
        return _nodeCount++;
      },
    ),
  )..setOnScaleChange((scale) {
      // can use to optimize the performance
      // if scale is too small, can use simple node and edge builder to improve performance
      if (!mounted) return;
      setState(() {
        _scale = scale;
      });
    });

  int _nodeCount = 0;
  final Set<int> _nodes = {};
  final Set<String> _edges = {};
  double _scale = 1;
  final int _locatedTo = 0;
  int? _draggingData;
  String? _json;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.needUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ForceDirectedGraphWidget(
      controller: controller,
      nodesBuilder: (context, data) {
        return InkWell(
          onTap: () {
            Routefly.of(context).push(
              routePaths.pesquisadores.$id.changes({
                'id': data.toString(),
              }),
            );
          },
          child: CircleAvatar(
            child: Text(data.toString()),
          ),
        );
      },
      edgesBuilder: (context, a, b, distance) {
        return DottedBorder(
          customPath: (size) {
            return Path()
              ..moveTo(0, 0)
              ..lineTo(size.width, size.height);
          },
          dashPattern: const [6, 3],
          child: SizedBox(
            width: distance,
          ),
        );
      },
    );
  }
}
