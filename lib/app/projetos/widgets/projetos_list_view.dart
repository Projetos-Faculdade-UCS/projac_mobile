import 'package:flutter/material.dart';
import 'package:projac_mobile/app/projetos/widgets/projeto_list_tile/projeto_list_tile.dart';
import 'package:projac_mobile/core/api/models/projeto_list.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class ProjetosListView extends StatelessWidget {
  const ProjetosListView({required this.projetos, super.key});
  final List<ProjetoList> projetos;

  static Widget get skeleton {
    final projetos = List.generate(10, (index) => ProjetoList.skeleton());

    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!.withAlpha(100),
        highlightColor: Colors.white.withAlpha(100),
      ),
      child: ProjetosListView(projetos: projetos),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SuperListView.builder(
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
