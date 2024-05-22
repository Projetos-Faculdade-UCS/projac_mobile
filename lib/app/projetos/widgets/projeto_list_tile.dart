import 'package:flutter/material.dart';
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
    final boxDecoration = !isLast
        ? BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          )
        : null;
    return Container(
      decoration: boxDecoration,
      child: ListTile(
        title: Text(projeto.titulo),
        subtitle: Text(projeto.objetivo),
        onTap: () {
          Routefly.pushNavigate('/projetos/${projeto.id}');
        },
      ),
    );
  }
}
