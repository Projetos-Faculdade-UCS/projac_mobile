import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:projac_mobile/src/core/theme/main_theme.dart';

class ThemeCubit extends HydratedCubit<ThemeData> {
  ThemeCubit() : super(MainTheme.lightTheme);

  void toggleTheme() {
    emit(state.brightness == Brightness.light
        ? MainTheme.darkTheme
        : MainTheme.lightTheme);
  }

  @override
  ThemeData fromJson(Map<String, dynamic> json) {
    return json['brightness'] == Brightness.light.index
        ? MainTheme.lightTheme
        : MainTheme.darkTheme;
  }

  @override
  Map<String, dynamic> toJson(ThemeData state) {
    return <String, dynamic>{'brightness': state.brightness.index};
  }
}
