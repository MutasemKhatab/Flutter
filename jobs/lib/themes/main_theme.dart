import 'package:flutter/material.dart';

// * defining colors
// * colors is from https://www.realtimecolors.com/?colors=edf2e9-040703-73bb2a-4d8a0f-61c101&fonts=Readex%20Pro-Readex%20Pro

const textColor = Color(0xFF11160d);
const backgroundColor = Color(0xFFf9fcf8);
const primaryColor = Color(0xFF8cd544);
const primaryFgColor = Color(0xFF11160d);
const secondaryColor = Color(0xFFb3f075);
const secondaryFgColor = Color(0xFF11160d);
const accentColor = Color(0xFF9efe3e);
const accentFgColor = Color(0xFF11160d);

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

const textDarkColor = Color(0xFFedf2e9);
const backgroundDarkColor = Color(0xFF040703);
const primaryDarkColor = Color(0xFF73bb2a);
const primaryFgDarkColor = Color(0xFF040703);
const secondaryDarkColor = Color(0xFF4d8a0f);
const secondaryFgDarkColor = Color(0xFF040703);
const accentDarkColor = Color(0xFF61c101);
const accentFgDarkColor = Color(0xFF040703);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  background: backgroundDarkColor,
  onBackground: textDarkColor,
  primary: primaryDarkColor,
  onPrimary: primaryFgDarkColor,
  secondary: secondaryDarkColor,
  onSecondary: secondaryFgDarkColor,
  tertiary: accentDarkColor,
  onTertiary: accentFgDarkColor,
  surface: backgroundDarkColor,
  onSurface: textDarkColor,
  error: Brightness.dark == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.dark == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);

// * defining themes

final ThemeData theme = ThemeData(
  colorScheme: colorScheme,
  fontFamily: 'Readex Pro',
  
);

final ThemeData darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  fontFamily: 'Readex Pro',
);
