import 'package:acadion/app/_widgets/custom_badge.dart';
import 'package:acadion/app/_widgets/detail/detail_field.dart';
import 'package:acadion/app/_widgets/ler_mais.dart';
import 'package:acadion/app/_widgets/outlined_badge.dart';
import 'package:acadion/core/api/models/projeto.dart';
import 'package:acadion/core/api/models/status_projeto.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
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
          leading: Icon(
            projeto.status.iconData,
            color: projeto.status.getIconColor(
              Theme.of(context).brightness,
            ),
          ),
          title: const Text('Status'),
          child: Text(projeto.status.name),
        ),
        DetailField(
          icon: Ionicons.flag_outline,
          title: const Text('Objetivo'),
          child: Text(projeto.objetivo),
        ),
        ..._buildSubareas(),
        if (projeto.descricao != null)
          DetailField(
            icon: Ionicons.document_outline,
            title: const Text('Descrição'),
            child: LerMais(
              projeto.descricao!,
            ),
          ),
        DetailField(
          icon: Ionicons.calendar_outline,
          title: const Text('Data de Criação'),
          child: Text(projeto.dataCriacao),
        ),
        if (projeto.dataConclusao != null)
          DetailField(
            icon: Ionicons.calendar_outline,
            title: const Text('Data de Conclusão'),
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
        title: const Text('Área e Subáreas'),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            CustomBadge(
              color: projeto.area.cor,
              boxShadow: [
                BoxShadow(
                  color: projeto.area.cor.withValues(alpha: 0.5),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
              child: Text(projeto.area.nome),
            ),
            ...projeto.subareas.map(
              (subarea) => OutlinedBadge(
                color: subarea.cor,
                boxShadow: [
                  BoxShadow(
                    color: subarea.cor.withValues(alpha: 0.5),
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
