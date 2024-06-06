import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_field.dart';
import 'package:projac_mobile/core/api/models/producao_academica.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class ProducoesAcademicasTab extends StatelessWidget {
  const ProducoesAcademicasTab({required this.producoesAcademicas, super.key});

  final List<ProducaoAcademica> producoesAcademicas;

  static Widget get skeleton {
    final producoesAcademicas = List.generate(
      5,
      (index) => ProducaoAcademica.skeleton(),
    );

    return ProducoesAcademicasTab(producoesAcademicas: producoesAcademicas);
  }

  @override
  Widget build(BuildContext context) {
    return SuperListView(
      padding: const EdgeInsets.all(8),
      children: producoesAcademicas
          .map(
            (producao) => DetailField(
              icon: Ionicons.document_outline,
              title: producao.titulo,
              child: Text(producao.tipo),
            ),
          )
          .toList(),
    );
  }
}
