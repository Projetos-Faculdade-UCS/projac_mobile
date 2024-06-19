import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/graph/graph_widget.dart';

class GraphCard extends StatelessWidget {
  const GraphCard({
    required this.title,
    required this.onTap,
    super.key,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          height: 250,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const Expanded(
                child: GraphWidget(
                  key: Key('graph_widget'),
                  interactive: false,
                  maxNodes: 10,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 16),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
