import 'package:flutter/material.dart';

final class LabClinicasTheme {
  static const orageColor = Color(0xFFFFAE45);
  static const lighOrageColor = Color(0xFFFFEFE9);
  static const blueColor = Color(0xFF01bdd6);
  //static const lighGrayColor = Color(0xFFFFFEFE9);

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: lighOrageColor),
  );

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: lighOrageColor),
    useMaterial3: true,
    fontFamily: 'Montserrat',
    scaffoldBackgroundColor: lighOrageColor,
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lighOrageColor,
        labelStyle: const TextStyle(
          fontSize: 14,
          color: orageColor,
          fontWeight: FontWeight.w700,
        ),
        floatingLabelStyle:
            const TextStyle(color: blueColor, fontWeight: FontWeight.w600),
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        border: _defaultInputBorder,
        errorBorder: _defaultInputBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: blueColor,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w700)),
    ),
  );

  static final darkTheme = lightTheme;

  static const titleStyle = TextStyle(
    color: blueColor,
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  static const titleSmallStyle = TextStyle(
    color: blueColor,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );
  static const subTitleStyle = TextStyle(
    color: blueColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}
