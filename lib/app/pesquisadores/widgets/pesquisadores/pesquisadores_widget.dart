import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/core/api/models/pesquisador.dart';
import 'package:projac_mobile/routes.dart';
import 'package:routefly/routefly.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class PesquisadoresWidget extends StatelessWidget {
  const PesquisadoresWidget({
    required this.pesquisadores,
    super.key,
  });

  final List<Pesquisador> pesquisadores;

  static Widget get skeleton {
    final pesquisadores = List.generate(
      10,
      (index) => Pesquisador.skeleton(),
    );

    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!.withOpacity(.3),
        highlightColor: Colors.grey[100]!.withOpacity(.5),
      ),
      child: PesquisadoresWidget(pesquisadores: pesquisadores),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SuperListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: pesquisadores.length,
      itemBuilder: (context, index) {
        final pesquisador = pesquisadores[index];

        return ListTile(
          leading: Skeleton.replace(
            height: 40,
            width: 40,
            replacement: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey[300]!.withOpacity(.3),
                shape: BoxShape.circle,
              ),
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(pesquisador.fotoPerfil),
            ),
          ),
          title: Text(pesquisador.nomeCompleto),
          subtitle: Text(pesquisador.genero),
          trailing: const Skeleton.keep(
            child: Icon(Ionicons.chevron_forward),
          ),
          onTap: () {
            Routefly.pushNavigate(
              routePaths.pesquisadores.$id.changes({
                'id': pesquisador.id.toString(),
              }),
            );
          },
        );
      },
    );
  }
}
