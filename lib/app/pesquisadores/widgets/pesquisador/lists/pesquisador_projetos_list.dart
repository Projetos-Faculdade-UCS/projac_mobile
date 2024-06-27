import 'package:acadion/app/pesquisadores/widgets/pesquisador/projeto_pesquisador_list_tile.dart';
import 'package:acadion/app/projetos/widgets/projetos_list_view.dart';
import 'package:acadion/core/api/models/projeto_list.dart';
import 'package:flutter/material.dart';

class PesquisadorProjetosList extends StatelessWidget {
  const PesquisadorProjetosList({
    required this.projetos,
    super.key,
  });

  final List<ProjetoList> projetos;

  @override
  Widget build(BuildContext context) {
    return ProjetosListView(
      projetos: projetos,
      itemBuilder: (context, index) {
        final projeto = projetos[index];
        return ProjetoPesquisadorListTile(
          projeto: projeto,
          isLast: index == projetos.length - 1,
        );
      },
    );
  }
}
