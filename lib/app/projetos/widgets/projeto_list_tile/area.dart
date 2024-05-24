import 'package:flutter/material.dart';
import 'package:projac_mobile/core/api/models/area.dart';

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
          color: area.color,
        ),
        const SizedBox(width: 8),
        Text(
          'Ciências Biológicas',
          style: TextStyle(
            color: area.color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
