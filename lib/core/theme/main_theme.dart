import 'package:flutter/material.dart';

class MainTheme {
  MainTheme._();
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF3A0CA3),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3A0CA3),
          foregroundColor: Color(0xFFFFFFFF),
          titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
          iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF3A0CA3),
          foregroundColor: Color(0xFFFFFFFF),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF0E0B0D)),
          bodyMedium: TextStyle(color: Color(0xFF0E0B0D)),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Color(0xFFFFFFFF),
          unselectedLabelColor: Color(0xFFFFFFFF),
          tabAlignment: TabAlignment.start,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(
              color: const Color(0xFF3A0CA3).withAlpha(50).withOpacity(.1),
            ),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.white.withOpacity(.5),
          selectionHandleColor: const Color(0xFF7209B7),
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF3A0CA3),
          secondary: Color(0xFF7209B7),
          surface: Color(0xFFFAF7FA),
          onSecondary: Color(0xFFFFFFFF),
          onSurface: Color(0xFF0E0B0D),
        ),
      );

  // TODO(marhaubrich): Mudar para final
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF8A5EF3),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF8A5EF3),
          foregroundColor: Color(0xFFFFFFFF),
          titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
          iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF8A5EF3),
          foregroundColor: Color(0xFFFFFFFF),
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: Color(0xFFF4F1F3)),
          bodyLarge: TextStyle(color: Color(0xFFF4F1F3)),
          bodyMedium: TextStyle(color: Color(0xFFF4F1F3)),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Color(0xFFFFFFFF),
          unselectedLabelColor: Color(0xFFFFFFFF),
          tabAlignment: TabAlignment.start,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(
              color: const Color(0xFF8A5EF3).withAlpha(50).withOpacity(.1),
            ),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.white.withOpacity(.5),
          selectionHandleColor: const Color(0xFFB046F6),
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF8A5EF3),
          secondary: Color(0xFFB046F6),
          surface: Color(0xFF090609),
          onPrimary: Color(0xFFFFFFFF),
          onSecondary: Color(0xFFFFFFFF),
          onSurface: Color(0xFFF4F1F3),
        ),
      );

  static final LinearGradient lightGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    colors: [
      lightTheme.primaryColor,
      lightTheme.primaryColor,
      lightTheme.colorScheme.secondary,
    ],
  );

  static final LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    colors: [
      darkTheme.primaryColor,
      darkTheme.primaryColor,
      darkTheme.colorScheme.secondary,
    ],
  );

  static LinearGradient getGradient(Brightness brightness) {
    return brightness == Brightness.light ? lightGradient : darkGradient;
  }

  static Shader getGradientShader(Brightness brightness, Rect bounds) {
    return getGradient(brightness).createShader(bounds);
  }
}
