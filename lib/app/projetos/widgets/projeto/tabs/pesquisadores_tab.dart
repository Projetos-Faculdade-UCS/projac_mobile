import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_field.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class PesquisadoresTab extends StatelessWidget {
  const PesquisadoresTab({required this.projeto, super.key});

  final Projeto projeto;

  @override
  Widget build(BuildContext context) {
    return SuperListView(
      padding: const EdgeInsets.all(8),
      children: projeto.pesquisadores
          .map(
            (pesquisador) => DetailField(
              icon: Ionicons.person_outline,
              title: pesquisador.nome,
              child: Text(pesquisador.cargo),
            ),
          )
          .toList(),
    );
  }
}
