import 'package:flutter/material.dart';
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
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(pesquisador.fotoPerfil),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            pesquisador.nomeCompleto,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            pesquisador.email,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            pesquisador.genero,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            pesquisador.dataNascimento,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {
              launchUrl(pesquisador.curriculoLattesUri);
            },
            child: const Text('Ver currículo Lattes'),
          ),
        ],
      ),
    );
  }
}
