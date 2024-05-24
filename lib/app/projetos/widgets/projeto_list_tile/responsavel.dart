import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/core/api/models/pesquisador.dart';

class Responsavel extends StatelessWidget {
  const Responsavel({
    required this.responsavel,
    super.key,
  });

  final Pesquisador responsavel;

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
          responsavel.nome,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
