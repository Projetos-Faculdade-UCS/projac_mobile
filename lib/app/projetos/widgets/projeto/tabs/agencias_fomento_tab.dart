import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_field.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class AgenciasFomentoTab extends StatelessWidget {
  const AgenciasFomentoTab({required this.projeto, super.key});

  final Projeto projeto;

  @override
  Widget build(BuildContext context) {
    return SuperListView(
      padding: const EdgeInsets.all(8),
      children: projeto.agenciasFomento
          .map(
            (agencia) => DetailField(
              icon: Ionicons.business_outline,
              title: Text(agencia.nome),
              child: Text(agencia.sigla),
            ),
          )
          .toList(),
    );
  }
}
