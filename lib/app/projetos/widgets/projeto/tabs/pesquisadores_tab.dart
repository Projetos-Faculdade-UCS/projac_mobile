import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/detail/detail_field.dart';
import 'package:projac_mobile/core/api/models/projeto.dart';
import 'package:projac_mobile/routes.dart';
import 'package:routefly/routefly.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class PesquisadoresTab extends StatelessWidget {
  const PesquisadoresTab({required this.projeto, super.key});

  final Projeto projeto;

  @override
  Widget build(BuildContext context) {
    return SuperListView(
      padding: const EdgeInsets.all(8),
      children: projeto.pesquisadores
          .map(
            (pesquisador) => DetailField(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  pesquisador.fotoPerfil,
                ),
                child: pesquisador.fotoPerfil.isEmpty
                    ? const Icon(
                        Ionicons.person_outline,
                        size: 40,
                      )
                    : null,
              ),
              title: '${pesquisador.nome} ${pesquisador.sobrenome}',
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: pesquisador.cargo,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Baseline(
                        baseline: 5, // Adjust this value as needed
                        baselineType: TextBaseline.alphabetic,
                        child: Text(
                          '   ●   ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 6,
                          ),
                        ),
                      ),
                    ),
                    TextSpan(
                      text: '${pesquisador.horas}h no projeto',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Routefly.pushNavigate(
                  routePaths.pesquisadores.$id.changes(
                    {
                      'id': pesquisador.id.toString(),
                    },
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }
}
