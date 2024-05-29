import 'package:flutter/material.dart';
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
        ListTile(
          title: const Text('Nome'),
          subtitle: Text(projeto.titulo),
        ),
        ListTile(
          title: const Text('Objetivo'),
          subtitle: Text(projeto.objetivo),
        ),
        if (projeto.descricao != null)
          _DescricaoProjeto(descricao: projeto.descricao!),
        ListTile(
          title: const Text('Data de criação'),
          subtitle: Text(projeto.dataCriacao),
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

class _DescricaoProjeto extends StatelessWidget {
  const _DescricaoProjeto({
    required this.descricao,
  });
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Descrição',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Theme.of(context).cardColor,
      collapsedBackgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      children: [
        Container(
          constraints: const BoxConstraints(maxHeight: 200),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(descricao),
            ),
          ),
        ),
      ],
    );
  }
}
