import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    required this.child,
    required this.color,
    super.key,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 4,
    ),
    this.boxShadow,
  });

  final Widget child;
  final Color color;
  final EdgeInsets padding;
  static const TextStyle _textStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: boxShadow,
      ),
      child: DefaultTextStyle(
        style: _textStyle.copyWith(
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
