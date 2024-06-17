import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_field.dart';
import 'package:projac_mobile/app/_widgets/ler_mais.dart';
import 'package:projac_mobile/core/api/models/producao_academica.dart';

class ProducaoAcademicaDetail extends StatelessWidget {
  const ProducaoAcademicaDetail({
    required this.producaoAcademica,
    super.key,
  });

  final ProducaoAcademica producaoAcademica;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DetailField(
          icon: Ionicons.book_outline,
          title: 'Tipo',
          child: Text(producaoAcademica.tipo),
        ),
        DetailField(
          icon: Ionicons.document_outline,
          title: 'Descrição',
          child: LerMais(
            producaoAcademica.descricao,
            maxLines: 6,
          ),
        ),
      ],
    );
  }
}
