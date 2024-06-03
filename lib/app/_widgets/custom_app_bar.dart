import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.centerTitle,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.bottom,
  });
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    /// This part is copied from CustomAppBar class
    final scaffold = Scaffold.maybeOf(context);
    final hasDrawer = scaffold?.hasDrawer ?? false;
    final canPop = Navigator.of(context).canPop();

    var leadingIcon = leading;

    if (leadingIcon == null && automaticallyImplyLeading) {
      if (hasDrawer) {
        leadingIcon = IconButton(
          icon: const Icon(
            Ionicons.menu_outline,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      } else {
        if (canPop) {
          leadingIcon = IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Ionicons.arrow_back_outline,
            ),
          );
        }
      }
    }

    return AppBar(
      leading: leadingIcon,
      title: title,
      bottom: bottom,
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize {
    var height = kToolbarHeight;
    if (bottom != null) {
      height += bottom!.preferredSize.height;
    }

    return Size.fromHeight(height);
  }
}
