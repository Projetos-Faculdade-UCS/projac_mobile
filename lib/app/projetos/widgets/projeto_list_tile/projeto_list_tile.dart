import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
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
          const Positioned(
            right: 0,
            child: TopCornerFlag(
              color: Colors.green,
              padding: EdgeInsets.only(top: 2, right: 2),
              borderRadius: 6,
              icon: Icon(
                Ionicons.checkmark_done_sharp,
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

class TopCornerFlag extends StatelessWidget {
  const TopCornerFlag({
    required this.borderRadius,
    required this.color,
    required this.icon,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  final double borderRadius;
  final Color color;
  final Widget icon;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipPath(
          clipper: _TopCornerFlagClipper(borderRadius),
          child: Container(
            height: 40,
            width: 40,
            color: color,
          ),
        ),
        Container(
          margin: padding,
          child: icon,
        ),
      ],
    );
  }
}

class _TopCornerFlagClipper extends CustomClipper<Path> {
  _TopCornerFlagClipper(this.borderRadius);

  final double borderRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - borderRadius, 0)
      ..arcToPoint(
        Offset(size.width, borderRadius),
        radius: Radius.circular(borderRadius),
      )
      ..lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
