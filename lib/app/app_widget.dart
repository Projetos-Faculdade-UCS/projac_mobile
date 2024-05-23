import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            ),
            theme: theme,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
