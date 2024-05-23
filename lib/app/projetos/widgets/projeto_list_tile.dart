import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
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

  static const Color _areaColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(
            color: _areaColor,
            width: 4,
          ),
        ),
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Título do Projeto',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(width: 8),
            Icon(
              Ionicons.close,
              size: 20,
              color: Colors.red,
              shadows: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 1,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Meu projeto serve para fazer isso, aquilo, pipipi, popopo, '
              'e mais um monte de coisas que eu não sei o que é.',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Ionicons.person_outline,
                  size: 16,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Text(
                  projeto.pesquisadores.first.nome,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            const Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 12,
                  color: _areaColor,
                ),
                SizedBox(width: 8),
                Text(
                  'Ciências Biológicas',
                  style: TextStyle(
                    color: _areaColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        // trailing: const Icon(
        //   Ionicons.construct,
        //   size: 20,
        //   color: Colors.orange,
        //   shadows: [
        //     BoxShadow(
        //       color: Colors.black26,
        //       blurRadius: 1,
        //       offset: Offset(0, 2),
        //     ),
        //   ],
        // ),
        onTap: () {
          Routefly.pushNavigate('/projetos/${projeto.id}');
        },
      ),
    );
  }
}
