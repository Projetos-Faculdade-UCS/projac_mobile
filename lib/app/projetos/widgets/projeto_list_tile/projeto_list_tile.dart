import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/projeto_status_extension.dart';
import 'package:projac_mobile/app/_widgets/top_corner_flag.dart';
import 'package:projac_mobile/app/projetos/widgets/projeto_list_tile/area.dart';
import 'package:projac_mobile/app/projetos/widgets/projeto_list_tile/responsavel.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';
import 'package:routefly/routefly.dart';

class ProjetoListTile extends StatelessWidget {
  const ProjetoListTile({
    required this.projeto,
    required this.isLast,
    super.key,
  });

  final Projeto projeto;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border(
                left: BorderSide(
                  color: projeto.area.color,
                  width: 4,
                ),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                projeto.titulo,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    projeto.objetivo,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Responsavel(responsavel: projeto.pesquisadores.first),
                  const SizedBox(height: 2),
                  AreaWidget(area: projeto.area),
                ],
              ),
              onTap: () {
                Routefly.pushNavigate('/projetos/${projeto.id}');
              },
            ),
          ),
          Positioned(
            right: 0,
            child: TopCornerFlag(
              color: projeto.status.color,
              padding: const EdgeInsets.only(top: 2, right: 2),
              borderRadius: 6,
              icon: Icon(
                projeto.status.iconData,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
