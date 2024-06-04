import 'package:flutter/material.dart';
import 'package:projac_mobile/app/projetos/widgets/projeto_list_tile/projeto_list_tile.dart';
import 'package:projac_mobile/core/api/models/projeto_list.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class ProjetosListView extends StatelessWidget {
  const ProjetosListView({required this.projetos, super.key});
  final List<ProjetoList> projetos;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Projeto',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Text(
                'Status',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SuperListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: projetos.length,
            itemBuilder: (context, index) {
              final projeto = projetos[index];
              return ProjetoListTile(
                projeto: projeto,
                isLast: index == projetos.length - 1,
              );
            },
          ),
        ),
      ],
    );
  }
}
