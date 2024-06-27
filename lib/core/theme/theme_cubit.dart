import 'package:acadion/core/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

ThemeData get _initialTheme {
  final brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  final isDarkMode = brightness == Brightness.dark;

  return isDarkMode ? MainTheme.darkTheme : MainTheme.lightTheme;
}

class ThemeCubit extends HydratedCubit<ThemeData> {
  ThemeCubit() : super(_initialTheme);

  void toggleTheme() {
    emit(
      state.brightness == Brightness.light
          ? MainTheme.darkTheme
          : MainTheme.lightTheme,
    );
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
