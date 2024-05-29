import 'package:flutter/material.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';

class ProjetoDetail extends StatelessWidget {
  const ProjetoDetail({
    required this.projeto,
    super.key,
  });
  final Projeto projeto;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
          ListTile(
            title: const Text('Descrição'),
            subtitle: Text(projeto.descricao!),
          ),
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
