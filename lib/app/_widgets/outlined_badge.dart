import 'package:flutter/material.dart';

class OutlinedBadge extends StatelessWidget {
  const OutlinedBadge({
    required this.child,
    required this.color,
    super.key,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 4,
    ),
  });

  final Widget child;
  final Color color;
  final EdgeInsets padding;
  static const TextStyle _textStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DefaultTextStyle(
        style: _textStyle.copyWith(
          color: color,
        ),
        child: child,
      ),
    );
  }
}
