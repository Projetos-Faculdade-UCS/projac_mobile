import 'package:acadion/core/api/models/coordenador.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CoordenadorWidget extends StatelessWidget {
  const CoordenadorWidget({
    required this.coordenador,
    super.key,
  });

  final Coordenador coordenador;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Ionicons.person_outline,
          size: 16,
          color: Colors.grey,
        ),
        const SizedBox(width: 4),
        Text(
          coordenador.nomeCompleto,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
