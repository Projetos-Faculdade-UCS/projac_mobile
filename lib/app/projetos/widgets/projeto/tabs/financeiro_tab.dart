import 'package:acadion/app/_widgets/detail/detail_field.dart';
import 'package:acadion/app/_widgets/detail/detail_section.dart';
import 'package:acadion/app/_widgets/valor.dart';
import 'package:acadion/core/api/models/projeto.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
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
          title: const Text('Valor Solicitado'),
          icon: Ionicons.cash_outline,
          child: Valor(
            valor: projeto.valorSolicitado,
            fontSize: 15,
          ),
        ),
        DetailField(
          title: const Text('Valor Arrecadado'),
          icon: Ionicons.cash_outline,
          child: Valor(
            valor: projeto.valorTotalArrecadado,
            fontSize: 15,
          ),
        ),
        if (projeto.valoresArrecadados.isNotEmpty)
          DetailSection(
            title: 'Histórico de Valores',
            children: projeto.valoresArrecadados
                .map(
                  (valor) => DetailField(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Ionicons.trending_up_outline,
                        color: Colors.green.shade700,
                      ),
                    ),
                    title: Valor(valor: valor.valor),
                    child: Text(valor.descricao),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}
