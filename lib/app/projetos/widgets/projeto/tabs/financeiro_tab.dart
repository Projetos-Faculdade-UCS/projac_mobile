import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_field.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_section.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class FinanceiroTab extends StatelessWidget {
  const FinanceiroTab({required this.projeto, super.key});

  final Projeto projeto;

  @override
  Widget build(BuildContext context) {
    return SuperListView(
      padding: const EdgeInsets.all(8),
      children: [
        DetailField(
          title: 'Valor Solicitado',
          icon: Ionicons.cash_outline,
          child: Text('R\$ ${projeto.valorSolicitado}'),
        ),
        DetailField(
          title: 'Valor Arrecadado',
          icon: Ionicons.cash_outline,
          child: Text('R\$ ${projeto.valorTotalArrecadado}'),
        ),
        if (projeto.valoresArrecadados.isNotEmpty)
          DetailSection(
            title: 'Valores Arrecadados',
            children: projeto.valoresArrecadados
                .map(
                  (valor) => DetailField(
                    icon: Ionicons.cash_outline,
                    title: 'R\$ ${valor.valor}',
                    child: Text(valor.descricao),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}
