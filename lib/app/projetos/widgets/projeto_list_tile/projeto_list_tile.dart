import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/projeto_base_list_tile.dart';
import 'package:projac_mobile/app/projetos/widgets/projeto_list_tile/area.dart';
import 'package:projac_mobile/app/projetos/widgets/projeto_list_tile/coordenador.dart';
import 'package:projac_mobile/core/api/models/projeto_list.dart';
import 'package:projac_mobile/core/api/models/status_projeto.dart';
import 'package:routefly/routefly.dart';

class ProjetoListTile extends StatelessWidget {
  const ProjetoListTile({
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
      subtitle: Text(
        projeto.objetivo,
      ),
      trailing: [
        CoordenadorWidget(coordenador: projeto.coordenador),
        const SizedBox(height: 2),
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
