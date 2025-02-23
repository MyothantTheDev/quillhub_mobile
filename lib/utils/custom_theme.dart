import 'package:flutter/material.dart';

class CustomTheme {

  static TextStyle _textStyleTitle(double fontSize, bool darkTheme, {FontWeight? fontWeight, FontStyle? fontStyle}) {
    return TextStyle(
      fontFamily: _TextStyleConstants.fontFamilyTitle,
      color: darkTheme ? _TextStyleConstants.textColorDarkTheme : _TextStyleConstants.textColorWhiteTheme,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontStyle: fontStyle ?? FontStyle.normal
    );
  }

  static TextStyle _textStyleBody(double fontSize, bool darkTheme, {FontWeight? fontWeight, FontStyle? fontStyle}) {
    return TextStyle(
      fontFamily: _TextStyleConstants.fontFamilyBody,
      color: darkTheme ? _TextStyleConstants.textColorDarkTheme : _TextStyleConstants.textColorWhiteTheme,
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
        titleLarge: _textStyleTitle(25, true),
        titleMedium: _textStyleTitle(22, true),
        titleSmall: _textStyleTitle(20, true),
        bodyLarge: _textStyleBody(20, true, fontWeight: FontWeight.w500),
        bodyMedium: _textStyleBody(18, true),
        bodySmall: _textStyleBody(16, true, fontStyle: FontStyle.italic),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: _textStyleTitle(20, true),
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white38),
        )
      )
    );

  }

  static ThemeData lightTheme() {

    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      textTheme: TextTheme(
        titleLarge: _textStyleTitle(25, false),
        titleMedium: _textStyleTitle(22, false),
        titleSmall: _textStyleTitle(20, false),
        bodyLarge: _textStyleBody(20, false, fontWeight: FontWeight.w500),
        bodyMedium: _textStyleBody(18, false),
        bodySmall: _textStyleBody(16, false, fontStyle: FontStyle.italic),
      ),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: _textStyleTitle(20, false),
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey.shade800),
          )
      )
    );

  }
}

class _TextStyleConstants {
  static String fontFamilyTitle = 'Pacifico';
  static String fontFamilyBody = 'Raleway';
  static Color textColorDarkTheme = Colors.grey.shade200;
  static Color textColorWhiteTheme = Colors.grey.shade800;
}