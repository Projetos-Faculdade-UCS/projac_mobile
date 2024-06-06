import 'package:flutter/material.dart';
import 'package:projac_mobile/app/projetos/widgets/projetos_list_view.dart';
import 'package:projac_mobile/core/api/models/projeto_list.dart';

class PesquisadorProjetosList extends StatelessWidget {
  const PesquisadorProjetosList({
    required this.projetos,
    super.key,
  });

  final List<ProjetoList> projetos;

  @override
  Widget build(BuildContext context) {
    return ProjetosListView(projetos: projetos);
  }
}
