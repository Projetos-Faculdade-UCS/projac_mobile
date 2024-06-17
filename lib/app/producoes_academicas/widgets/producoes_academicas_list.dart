import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/custom_skeletonizer.dart';
import 'package:projac_mobile/app/producoes_academicas/widgets/producao_academica_card.dart';
import 'package:projac_mobile/core/api/models/producao_academica.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class ProducoesAcademicasList extends StatelessWidget {
  const ProducoesAcademicasList({required this.producoesAcademicas, super.key});

  final List<ProducaoAcademica> producoesAcademicas;

  static Widget get skeleton {
    final producoesAcademicas = List.generate(
      15,
      (index) => ProducaoAcademica.skeleton(),
    );

    return CustomSkeletonizer(
      child: ProducoesAcademicasList(producoesAcademicas: producoesAcademicas),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SuperListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: producoesAcademicas.length,
      restorationId: 'producoes_academicas_list_view',
      itemBuilder: (context, index) {
        final producao = producoesAcademicas[index];

        return ProducaoAcademicaCard(
          producaoAcademica: producao,
        );
      },
    );
  }
}
