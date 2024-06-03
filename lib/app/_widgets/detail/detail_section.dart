import 'package:flutter/material.dart';

class DetailSection extends StatelessWidget {
  const DetailSection({
    required this.title,
    required this.children,
    super.key,
  });

  final String title;
  final List<Widget> children;

  static final _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  );

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      initiallyExpanded: true,
      shape: _shape,
      collapsedShape: _shape,
      childrenPadding: const EdgeInsets.only(left: 14),
      children: children,
    );
  }
}
