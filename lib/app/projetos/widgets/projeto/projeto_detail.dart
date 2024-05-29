import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_expandable_field.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_field.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';
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
          icon: const Icon(Icons.title),
          title: 'Título',
          child: Text(projeto.titulo),
        ),
        DetailField(
          icon: const Icon(Icons.money),
          title: 'Objetivo',
          child: Text(projeto.objetivo),
        ),
        if (projeto.descricao != null)
          DetailExpandableField(
            title: 'Descrição',
            child: Text(projeto.descricao!),
          ),
        DetailField(
          icon: const Icon(Icons.monetization_on),
          title: 'Data de criação',
          child: Text(projeto.dataCriacao),
        ),
        if (projeto.dataConclusao != null)
          ListTile(
            title: const Text('Data de Conclusão'),
            subtitle: Text(projeto.dataConclusao!),
          ),
      ],
    );
  }
}
