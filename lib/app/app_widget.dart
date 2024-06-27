import 'dart:math';

import 'package:acadion/core/get_it.dart';
import 'package:acadion/core/theme/theme_cubit.dart';
import 'package:acadion/routes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:routefly/routefly.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp.router(
            theme: theme,
            debugShowCheckedModeBanner: false,
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
                        ctx: context,
                      );
              },
            ),
          );
        },
      ),
    );
  }
}
