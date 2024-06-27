import 'package:acadion/core/api/models/area.dart';
import 'package:flutter/material.dart';

class AreaWidget extends StatelessWidget {
  const AreaWidget({
    required this.area,
    super.key,
  });
  final BaseArea area;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 12,
          color: area.cor,
        ),
        const SizedBox(width: 8),
        Text(
          area.nome,
          style: TextStyle(
            color: area.cor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
