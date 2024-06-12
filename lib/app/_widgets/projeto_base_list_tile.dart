import 'package:flutter/material.dart';
import 'package:projac_mobile/app/_widgets/top_corner_flag.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProjetoBaseListTile extends StatelessWidget {
  const ProjetoBaseListTile({
    required this.onTap,
    required this.isLast,
    required this.areaColor,
    required this.title,
    required this.topCornerFlagColor,
    required this.topCornerFlagIcon,
    required this.topCornerFlagIconColor,
    super.key,
    this.subtitle,
    this.trailing,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
  });

  final VoidCallback onTap;
  final bool isLast;
  final Color areaColor;
  final Widget title;
  final Widget? subtitle;
  final List<Widget>? trailing;
  final Color topCornerFlagColor;
  final IconData topCornerFlagIcon;
  final Color topCornerFlagIconColor;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        elevation: 5,
        child: InkWell(
          hoverColor: Colors.grey.withOpacity(0.3),
          hoverDuration: const Duration(milliseconds: 250),
          borderRadius: borderRadius,
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: areaColor,
                      width: 4,
                    ),
                  ),
                  borderRadius: borderRadius,
                ),
                child: ListTile(
                  mouseCursor: SystemMouseCursors.click,
                  tileColor: Theme.of(context).cardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  title: DefaultTextStyle(
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    child: title,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (subtitle != null) ...[
                        DefaultTextStyle(
                          style: Theme.of(context).textTheme.bodyMedium!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          child: subtitle!,
                        ),
                        const SizedBox(height: 8),
                      ],
                      if (trailing != null) ...[
                        const SizedBox(height: 8),
                        ...trailing!,
                      ],
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Skeleton.replace(
                  replacement: Skeleton.keep(
                    child: TopCornerFlag(
                      color: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.only(top: 4, right: 4),
                      borderRadius: 8,
                      icon: const SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  ),
                  child: TopCornerFlag(
                    color: topCornerFlagColor,
                    padding: const EdgeInsets.only(top: 5, right: 5),
                    borderRadius: 8,
                    icon: Icon(
                      topCornerFlagIcon,
                      size: 15,
                      color: topCornerFlagIconColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
