import 'package:flutter_modular/flutter_modular.dart';
import 'package:projac_mobile/src/core/theme/theme_cubit.dart';
import 'package:projac_mobile/src/modules/home/home_module.dart';
import 'package:projac_mobile/src/modules/settings/settings_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(ThemeCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: HomeModule());
    r.module('/settings', module: SettingsModule());
  }
}
