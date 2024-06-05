import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projac_mobile/core/theme/theme_cubit.dart';
import 'package:projac_mobile/routes.dart';
import 'package:routefly/routefly.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp.router(
            routerConfig: Routefly.routerConfig(
              routes: routes,
              routeBuilder: (context, settings, child) {
                Route<dynamic> rotating() {
                  return PageTransition(
                    type: PageTransitionType.rotate,
                    alignment: Alignment.center,
                    duration: const Duration(milliseconds: 500),
                    reverseDuration: const Duration(milliseconds: 500),
                    child: child,
                    settings: settings,
                    inheritTheme: true,
                    ctx: context,
                  );
                }

                var randomSeed = Random().nextInt(10000);
                final random1 = Random(randomSeed).nextInt(100);
                randomSeed = Random().nextInt(10000);
                final random2 = Random(randomSeed).nextInt(100);

                return random1 == random2
                    ? rotating()
                    : PageTransition(
                        settings: settings,
                        child: child,
                        type: PageTransitionType.theme,
                        inheritTheme: true,
                        ctx: context,
                      );
              },
            ),
            theme: theme,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
