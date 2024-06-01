import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_field.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';
import 'package:readmore/readmore.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class ProjetoDetail extends StatelessWidget {
  const ProjetoDetail({
    required this.projeto,
    super.key,
  });
  final Projeto projeto;

  @override
  Widget build(BuildContext context) {
    return SuperListView(
      padding: const EdgeInsets.all(8),
      children: [
        DetailField(
          icon: const Icon(Ionicons.bulb_outline),
          title: 'Objetivo',
          child: Text(projeto.objetivo),
        ),
        if (projeto.descricao != null)
          DetailField(
            icon: const Icon(Ionicons.document_text_outline),
            title: 'Descrição',
            child: ReadMoreText(
              projeto.descricao!,
              trimMode: TrimMode.Line,
              trimLines: 4,
              trimCollapsedText: '\nVer mais',
              trimExpandedText: '\nVer menos',
            ),
          ),
        DetailField(
          icon: const Icon(Ionicons.calendar_clear_outline),
          title: 'Data de criação',
          child: Text(projeto.dataCriacao),
        ),
        if (projeto.dataConclusao != null)
          DetailField(
            icon: const Icon(Ionicons.calendar_outline),
            title: 'Data de Conclusão',
            child: Text(projeto.dataConclusao!),
          ),
      ],
    );
  }
}
