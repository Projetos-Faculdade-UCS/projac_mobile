import 'package:acadion/app/pesquisadores/widgets/pesquisadores/pesquisador_card.dart';
import 'package:acadion/core/api/models/pesquisador_list.dart';
import 'package:flutter/material.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class PesquisadoresListView extends StatelessWidget {
  const PesquisadoresListView({
    required this.pesquisadores,
    super.key,
  });

  final List<PesquisadorList> pesquisadores;

  @override
  Widget build(BuildContext context) {
    return SuperListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: pesquisadores.length,
      restorationId: 'pesquisadores_list_view',
      itemBuilder: (context, index) {
        final pesquisador = pesquisadores[index];

        return PesquisadorCard(
          pesquisador: pesquisador,
        );
      },
    );
  }
}
