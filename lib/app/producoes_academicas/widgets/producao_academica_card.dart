import 'package:acadion/app/_widgets/gradient_icon.dart';
import 'package:acadion/core/api/models/producao_academica.dart';
import 'package:acadion/routes.g.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:routefly/routefly.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProducaoAcademicaCard extends StatelessWidget {
  const ProducaoAcademicaCard({
    required this.producaoAcademica,
    super.key,
  });

  final ProducaoAcademica producaoAcademica;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          producaoAcademica.titulo,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: const Skeleton.keep(
          child: GradientIcon(
            Ionicons.book_outline,
            size: 28,
          ),
        ),
        subtitle: Row(
          children: [
            Text(producaoAcademica.tipo),
          ],
        ),
        trailing: const Skeleton.keep(
          child: Icon(Ionicons.chevron_forward),
        ),
        onTap: () {
          Routefly.push<void>(
            routePaths.producoesAcademicas.$id.changes({
              'id': producaoAcademica.id.toString(),
            }),
          );
        },
      ),
    );
  }
}
