import 'package:acadion/app/_widgets/gradient_icon.dart';
import 'package:acadion/app/_widgets/projeto_base_list_tile.dart';
import 'package:acadion/app/projetos/widgets/projeto_list_tile/area.dart';
import 'package:acadion/core/api/models/projeto_list.dart';
import 'package:acadion/core/api/models/status_projeto.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:routefly/routefly.dart';

class ProjetoPesquisadorListTile extends StatelessWidget {
  const ProjetoPesquisadorListTile({
    required this.projeto,
    required this.isLast,
    super.key,
  });

  final ProjetoList projeto;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return ProjetoBaseListTile(
      onTap: () {
        Routefly.push<void>('/projetos/${projeto.id}');
      },
      isLast: isLast,
      areaColor: projeto.area.cor,
      title: Text(
        projeto.titulo,
      ),
      // subtitle: Text(
      //   '${projeto.horas}h trabalhadas',
      // ),
      trailing: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const GradientIcon(
              Ionicons.person_outline,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              projeto.cargo!,
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const GradientIcon(
              Ionicons.time_outline,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              '${projeto.horas}h trabalhadas',
            ),
          ],
        ),
        AreaWidget(area: projeto.area),
      ],
      topCornerFlagColor: projeto.status.getColor(Theme.of(context).brightness),
      topCornerFlagIcon: projeto.status.iconData,
      topCornerFlagIconColor: projeto.status.getIconColor(
        Theme.of(context).brightness,
      ),
    );
  }
}
