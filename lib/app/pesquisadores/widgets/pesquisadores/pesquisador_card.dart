import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/gradient_icon.dart';
import 'package:projac_mobile/core/api/models/pesquisador_list.dart';
import 'package:projac_mobile/routes.g.dart';
import 'package:routefly/routefly.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PesquisadorCard extends StatelessWidget {
  const PesquisadorCard({
    required this.pesquisador,
    super.key,
  });

  final PesquisadorList pesquisador;

  static Widget? _prototype;

  static Widget get prototype {
    final pesquisador = PesquisadorList.skeleton();

    return _prototype ??= PesquisadorCard(pesquisador: pesquisador);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          child: Skeleton.replace(
            height: 40,
            width: 40,
            replacement: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey[300]!.withOpacity(.3),
                shape: BoxShape.circle,
              ),
            ),
            child: CachedNetworkImage(
              height: 40,
              width: 40,
              memCacheHeight: 40,
              memCacheWidth: 40,
              imageUrl: pesquisador.fotoPerfil,
              placeholder: (context, url) => Skeletonizer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey[300]!.withOpacity(.3),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
              ),
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            pesquisador.nomeCompleto,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Detail(
              key: Key('pesquisador${pesquisador.id}Projetos'),
              text: '${pesquisador.numeroProjetos} projetos',
              icon: Ionicons.folder_open_outline,
            ),
            const SizedBox(height: 8),
            _Detail(
              key: Key('pesquisador${pesquisador.id}Producoes'),
              text: '${pesquisador.numeroProducoes} produções',
              icon: Ionicons.library_outline,
            ),
          ],
        ),
        trailing: const Skeleton.keep(
          child: Icon(Ionicons.chevron_forward),
        ),
        onTap: () {
          Routefly.push<void>(
            routePaths.pesquisadores.$id.changes({
              'id': pesquisador.id.toString(),
            }),
          );
        },
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail({
    required this.text,
    required this.icon,
    super.key,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Skeleton.keep(
          child: GradientIcon(
            icon,
            size: 16,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
