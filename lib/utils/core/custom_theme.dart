import 'package:flutter/material.dart';

class CustomTheme {

  static bool _is_darkMode = true;

  static TextStyle _textStyleTitle(double fontSize, {FontWeight? fontWeight, FontStyle? fontStyle}) {
    return TextStyle(
      fontFamily: _TextStyleConstants.fontFamilyTitle,
      color: _is_darkMode ? _TextStyleConstants.textColorDarkTheme : _TextStyleConstants.textColorWhiteTheme,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontStyle: fontStyle ?? FontStyle.normal
    );
  }

  static TextStyle _textStyleBody(double fontSize, {FontWeight? fontWeight, FontStyle? fontStyle}) {
    return TextStyle(
      fontFamily: _TextStyleConstants.fontFamilyBody,
      color: _is_darkMode ? _TextStyleConstants.textColorDarkTheme : _TextStyleConstants.textColorWhiteTheme,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontStyle: fontStyle ?? FontStyle.normal
    );
  }

  static ThemeData darkTheme() {

    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      textTheme: TextTheme(
        titleLarge: _textStyleTitle(25),
        titleMedium: _textStyleTitle(22),
        titleSmall: _textStyleTitle(20),
        bodyLarge: _textStyleBody(20, fontWeight: FontWeight.w500),
        bodyMedium: _textStyleBody(18),
        bodySmall: _textStyleBody(16, fontStyle: FontStyle.italic),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: _textStyleTitle(20),
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white38),
        )
      ),
    );

  }

  static ThemeData lightTheme() {
    _is_darkMode = false;
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      textTheme: TextTheme(
        titleLarge: _textStyleTitle(25),
        titleMedium: _textStyleTitle(22),
        titleSmall: _textStyleTitle(20),
        bodyLarge: _textStyleBody(20, fontWeight: FontWeight.w500),
        bodyMedium: _textStyleBody(18),
        bodySmall: _textStyleBody(16, fontStyle: FontStyle.italic),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: _textStyleTitle(20),
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey.shade800),
        ),

      ),

    );

  }
}

class _TextStyleConstants {
  static String fontFamilyTitle = 'Pacifico';
  static String fontFamilyBody = 'Raleway';
  static Color textColorDarkTheme = Colors.grey.shade200;
  static Color textColorWhiteTheme = Colors.grey.shade800;
}