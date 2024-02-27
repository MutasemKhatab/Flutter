// light theme
import 'package:flutter/material.dart';

const textColor = Color(0xFF05090a);
const backgroundColor = Color(0xFFffffff);
const primaryColor = Color(0xFF588cfe);
const primaryFgColor = Color(0xFF05090a);
const secondaryColor = Color(0xFFf0f5ff);
const secondaryFgColor = Color(0xFF05090a);
const accentColor = Color(0xFF5daee5);
const accentFgColor = Color(0xFF05090a);

const colorScheme = ColorScheme(
  brightness: Brightness.light,
  background: backgroundColor,
  onBackground: textColor,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.light == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);

// dark theme

const textColorDark = Color(0xFFf5f9fa);
const backgroundColorDark = Color(0xFF000000);
const primaryColorDark = Color(0xFF0136a7);
const primaryFgColorDark = Color(0xFFf5f9fa);
const secondaryColorDark = Color.fromARGB(255, 2, 19, 52);
const secondaryFgColorDark = Color(0xFFf5f9fa);
const accentColorDark = Color(0xFF1a6ca2);
const accentFgColorDark = Color(0xFFf5f9fa);

const colorSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  background: backgroundColorDark,
  onBackground: textColorDark,
  primary: primaryColorDark,
  onPrimary: primaryFgColorDark,
  secondary: secondaryColorDark,
  onSecondary: secondaryFgColorDark,
  tertiary: accentColorDark,
  onTertiary: accentFgColorDark,
  surface: backgroundColorDark,
  onSurface: textColorDark,
  error: Brightness.dark == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.dark == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);
