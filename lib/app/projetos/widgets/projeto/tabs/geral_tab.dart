import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/custom_badge.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_field.dart';
import 'package:projac_mobile/app/_widgets/outlined_badge.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';
import 'package:projac_mobile/core/api/models/status_projeto.dart';
import 'package:readmore/readmore.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class GeralTab extends StatelessWidget {
  const GeralTab({required this.projeto, super.key});

  final Projeto projeto;

  @override
  Widget build(BuildContext context) {
    return SuperListView(
      padding: const EdgeInsets.all(8),
      children: [
        DetailField(
          leading: Icon(projeto.status.iconData, color: projeto.status.color),
          title: 'Status',
          child: Text(projeto.status.name),
        ),
        DetailField(
          icon: Ionicons.flag_outline,
          title: 'Objetivo',
          child: Text(projeto.objetivo),
        ),
        ..._buildSubareas(),
        if (projeto.descricao != null)
          DetailField(
            icon: Ionicons.document_outline,
            title: 'Descrição',
            child: ReadMoreText(
              projeto.descricao!,
              trimLines: 3,
              trimMode: TrimMode.Line,
              trimCollapsedText: '\nVer mais',
              trimExpandedText: '\nVer menos',
            ),
          ),
        DetailField(
          icon: Ionicons.calendar_outline,
          title: 'Data de Criação',
          child: Text(projeto.dataCriacao),
        ),
        if (projeto.dataConclusao != null)
          DetailField(
            icon: Ionicons.calendar_outline,
            title: 'Data de Conclusão',
            child: Text(projeto.dataConclusao!),
          ),
      ],
    );
  }

  List<Widget> _buildSubareas() {
    if (projeto.subareas.isEmpty) {
      return [];
    }
    return [
      DetailField(
        icon: Ionicons.book_outline,
        title: 'Área e Subáreas',
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            CustomBadge(
              color: projeto.area.color,
              boxShadow: [
                BoxShadow(
                  color: projeto.area.color.withOpacity(0.5),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
              child: Text(projeto.area.nome),
            ),
            ...projeto.subareas.map(
              (subarea) => OutlinedBadge(
                color: subarea.color,
                boxShadow: [
                  BoxShadow(
                    color: subarea.color.withOpacity(0.5),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
                child: Text(subarea.nome),
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
