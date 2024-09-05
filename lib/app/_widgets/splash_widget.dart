import 'package:acadion/app/pesquisadores/bloc/pesquisadores_repository.dart';
import 'package:acadion/app/pesquisadores/get_it.dart';
import 'package:acadion/core/theme/main_theme.dart';
import 'package:acadion/routes.g.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:routefly/routefly.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late final bool _disposeGetIt;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    _disposeGetIt = setupPesquisadoresGetIt();

    final repository = pesquisadoresGetIt.get<PesquisadoresRepository>();

    Future.wait([repository.getGraph()]).then(
      (value) async {
        await Future<void>.delayed(
          const Duration(seconds: 1),
        );

        await _scaleController.forward();

        // Navigate after the animations
        await Routefly.navigate(routePaths.home);
      },
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    disposePesquisadoresGetIt(dispose: _disposeGetIt);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Gradient(
                child: DotLottieLoader.fromAsset(
                  'assets/lottie/Projac.lottie',
                  frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(
                        dotlottie.animations.values.single,
                        width: 200,
                        height: 200,
                      );
                    } else {
                      return const SizedBox(
                        width: 200,
                        height: 200,
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              _Gradient(
                child: Text(
                  'Acadion',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Gradient extends StatelessWidget {
  const _Gradient({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return MainTheme.getGradientShader(
          Theme.of(context).brightness,
          bounds,
        );
      },
      blendMode: BlendMode.srcIn,
      child: child,
    );
  }
}
