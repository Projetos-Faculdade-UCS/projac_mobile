import 'package:flutter_modular/flutter_modular.dart';
import 'package:projac_mobile/src/modules/settings/pages/settings_page.dart';

class SettingsModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const SettingsPage(),
      transition: TransitionType.rotate,
    );
  }
}
