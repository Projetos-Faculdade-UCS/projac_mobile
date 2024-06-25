import 'package:acadion/app/_widgets/custom_skeletonizer.dart';
import 'package:acadion/app/producoes_academicas/widgets/producao_academica_card.dart';
import 'package:acadion/core/api/models/producao_academica.dart';
import 'package:acadion/main.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
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
    if (producoesAcademicas.isEmpty) {
      return Column(
        children: [
          Flexible(
            child: RiveAnimation.direct(
              notFoundRive,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          const Expanded(child: Text('Nenhuma produção acadêmica encontrada.')),
        ],
      );
    }

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
