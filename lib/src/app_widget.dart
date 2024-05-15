import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projac_mobile/src/core/theme/theme_cubit.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      bloc: Modular.get(),
      builder: (context, theme) {
        return MaterialApp.router(
          title: 'My Smart App',
          theme: theme,
          routerConfig: Modular.routerConfig,
        );
      },
    );
  }
}
