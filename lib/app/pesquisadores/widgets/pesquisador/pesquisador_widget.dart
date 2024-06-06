import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_field.dart';
import 'package:projac_mobile/app/pesquisadores/widgets/pesquisador/openable_picture.dart';
import 'package:projac_mobile/core/api/models/pesquisador.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

class PesquisadorWidget extends StatelessWidget {
  const PesquisadorWidget({
    required this.pesquisador,
    super.key,
  });

  final Pesquisador pesquisador;

  static Widget get skeleton {
    final pesquisador = Pesquisador.skeleton();

    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!.withOpacity(.3),
        highlightColor: Colors.grey[100]!.withOpacity(.5),
      ),
      child: PesquisadorWidget(pesquisador: pesquisador),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface,
                  width: 2,
                ),
              ),
              child: Skeleton.replace(
                height: 100,
                width: 100,
                replacement: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey[300]!.withOpacity(.3),
                    shape: BoxShape.circle,
                  ),
                ),
                child: OpenablePicture(
                  image: NetworkImage(pesquisador.fotoPerfil),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            pesquisador.nomeCompleto,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          DetailField(
            title: 'E-mail',
            icon: Ionicons.mail_outline,
            child: Text(
              pesquisador.email,
            ),
          ),
          DetailField(
            title: 'Gênero',
            icon: Ionicons.woman_outline,
            child: Text(pesquisador.genero),
          ),
          DetailField(
            title: 'Data de nascimento',
            icon: Ionicons.calendar_outline,
            child: Text(pesquisador.dataNascimento),
          ),
          DetailField(
            title: 'Formação',
            icon: Ionicons.school_outline,
            onTap: () {
              launchUrl(pesquisador.curriculoLattesUri);
            },
            child: const Text('Ver currículo Lattes'),
          ),
        ],
      ),
    );
  }
}
