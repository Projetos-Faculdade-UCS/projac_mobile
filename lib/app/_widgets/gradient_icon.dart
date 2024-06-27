import 'package:acadion/core/theme/main_theme.dart';
import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget implements Icon {
  const GradientIcon(
    this.icon, {
    super.key,
    this.applyTextScaling,
    this.color,
    this.fill,
    this.grade,
    this.opticalSize,
    this.semanticLabel,
    this.shadows,
    this.size,
    this.textDirection,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return MainTheme.getGradientShader(
          Theme.of(context).brightness,
          bounds,
        );
      },
      blendMode: BlendMode.srcIn,
      child: Icon(
        icon,
        applyTextScaling: applyTextScaling,
        color: color,
        fill: fill,
        grade: grade,
        opticalSize: opticalSize,
        semanticLabel: semanticLabel,
        shadows: shadows,
        size: size,
        textDirection: textDirection,
        weight: weight,
      ),
    );
  }

  @override
  final bool? applyTextScaling;

  @override
  final Color? color;

  @override
  final double? fill;

  @override
  final double? grade;

  @override
  final IconData? icon;

  @override
  final double? opticalSize;

  @override
  final String? semanticLabel;

  @override
  final List<Shadow>? shadows;

  @override
  final double? size;

  @override
  final TextDirection? textDirection;

  @override
  final double? weight;
}
