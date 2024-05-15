import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final ThemeData _lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF6200EE),
      secondary: Color(0xFF03DAC6),
      surface: Color(0xFFDDDDDD),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
    ),
  );

  static final ThemeData _darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF6200EE),
      secondary: Color(0xFF03DAC6),
      surface: Color(0xFF333333),
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.white,
    ),
  );

  void toggleTheme() {
    emit(state.brightness == Brightness.light ? _darkTheme : _lightTheme);
  }

  @override
  ThemeData fromJson(Map<String, dynamic> json) {
    return json['brightness'] == Brightness.light.index
        ? _lightTheme
        : _darkTheme;
  }

  @override
  Map<String, dynamic> toJson(ThemeData state) {
    return <String, dynamic>{'brightness': state.brightness.index};
  }
}
