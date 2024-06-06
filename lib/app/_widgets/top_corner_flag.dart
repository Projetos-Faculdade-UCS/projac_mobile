import 'package:flutter/material.dart';

class TopCornerFlag extends StatelessWidget {
  const TopCornerFlag({
    required this.borderRadius,
    required this.color,
    required this.icon,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  final double borderRadius;
  final Color color;
  final Widget icon;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipPath(
          clipper: _TopCornerFlagClipper(
            borderRadius,
            color,
          ),
          child: Container(
            height: 40,
            width: 40,
            color: color,
          ),
        ),
        Container(
          margin: padding,
          child: icon,
        ),
      ],
    );
  }
}

class _TopCornerFlagClipper extends CustomClipper<Path> {
  _TopCornerFlagClipper(
    this.borderRadius,
    this.color,
  );

  final double borderRadius;
  final Color color;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - borderRadius, 0)
      ..arcToPoint(
        Offset(size.width, borderRadius),
        radius: Radius.circular(borderRadius),
      )
      ..lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant _TopCornerFlagClipper oldClipper) {
    return borderRadius != oldClipper.borderRadius ||
        oldClipper != this ||
        color != oldClipper.color;
  }
}
