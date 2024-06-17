import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class LerMais extends StatelessWidget {
  const LerMais(
    this.text, {
    super.key,
    this.maxLines = 3,
  });

  final String text;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: maxLines,
      trimMode: TrimMode.Line,
      trimCollapsedText: '\nVer mais',
      trimExpandedText: '\nVer menos',
    );
  }
}
