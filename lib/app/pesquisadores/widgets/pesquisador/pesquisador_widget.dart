import 'dart:async';

import 'package:acadion/app/_widgets/custom_skeletonizer.dart';
import 'package:acadion/app/_widgets/detail/detail_field.dart';
import 'package:acadion/app/pesquisadores/widgets/pesquisador/openable_picture.dart';
import 'package:acadion/core/api/models/pesquisador_detail.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

class PesquisadorWidget extends StatelessWidget {
  const PesquisadorWidget({
    required this.pesquisador,
    super.key,
  });

  final PesquisadorDetail pesquisador;

  static Widget get skeleton {
    final pesquisador = PesquisadorDetail.skeleton();

    return CustomSkeletonizer(
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
                    color: Colors.grey[300]!.withValues(alpha: .3),
                    shape: BoxShape.circle,
                  ),
                ),
                child: OpenablePicture(
                  imageUrl: pesquisador.fotoPerfil,
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
            title: const Text('E-mail'),
            icon: Ionicons.mail_outline,
            child: Text(
              pesquisador.email,
            ),
          ),
          DetailField(
            title: const Text('Data de nascimento'),
            icon: Ionicons.calendar_outline,
            child: Text(pesquisador.dataNascimento),
          ),
          DetailField(
            title: const Text('Formação'),
            icon: Ionicons.school_outline,
            onTap: () {
              unawaited(launchUrl(pesquisador.curriculoLattesUri));
            },
            child: const Text('Ver currículo Lattes'),
          ),
        ],
      ),
    );
  }
}
