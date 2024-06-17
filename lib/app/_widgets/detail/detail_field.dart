import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projac_mobile/app/_widgets/gradient_icon.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailField extends StatelessWidget {
  const DetailField({
    required this.title,
    required this.child,
    this.leading,
    this.icon,
    this.onTap,
    this.trailing,
    super.key,
  });

  final IconData? icon;
  final Widget? leading;
  final Widget title;
  final Widget child;
  final VoidCallback? onTap;
  final Widget? trailing;

  Widget? get _trailingIcon =>
      trailing ??
      (onTap != null
          ? const Icon(
              Ionicons.chevron_forward,
              size: 20,
            )
          : null);

  @override
  Widget build(BuildContext context) {
    assert(icon != null || leading != null, 'Icon or leading must be provided');
    assert(
      icon == null || leading == null,
      'Icon and leading cannot be provided at the same time',
    );
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
            ),
            child: icon != null
                ? Skeleton.keep(
                    child: GradientIcon(
                      icon,
                      size: 20,
                    ),
                  )
                : Skeleton.replace(
                    replacement: const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    ),
                    child: leading ?? const SizedBox.shrink(),
                  ),
          ),
          Expanded(
            child: ListTile(
              title: DefaultTextStyle(
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 16,
                    ),
                child: title,
              ),
              subtitle: Container(
                margin: const EdgeInsets.only(top: 4),
                child: child,
              ),
              onTap: onTap,
              trailing: _trailingIcon,
            ),
          ),
        ],
      ),
    );
  }
}
