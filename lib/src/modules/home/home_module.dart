import 'package:flutter_modular/flutter_modular.dart';
import 'package:projac_mobile/src/modules/home/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage(title: 'Flutter Demo Home Page'));
  }
}
