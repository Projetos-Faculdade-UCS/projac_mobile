import 'package:flutter/material.dart';
import 'package:projac_mobile/app/projetos/widgets/projeto_list_tile.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';

class ProjetosListView extends StatelessWidget {
  const ProjetosListView({required this.projetos, super.key});
  final List<Projeto> projetos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: projetos.length,
      itemBuilder: (context, index) {
        final projeto = projetos[index];
        return ProjetoListTile(
          projeto: projeto,
          isLast: index == projetos.length - 1,
        );
      },
    );
  }
}
