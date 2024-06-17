import 'package:flutter/material.dart';

class Valor extends StatelessWidget {
  const Valor({
    required this.valor,
    super.key,
    this.fontSize = 16,
  });

  final double valor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: r'R$ ',
        style: DefaultTextStyle.of(context).style.copyWith(
              color: Colors.grey.shade600,
              // fontWeight: FontWeight.w400,
              fontSize: fontSize * .8,
            ),
        children: [
          TextSpan(
            text: valor.toStringAsFixed(2).replaceAll('.', ','),
            style: DefaultTextStyle.of(context).style.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize,
                ),
          ),
        ],
      ),
    );
  }
}
