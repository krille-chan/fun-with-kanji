import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fun_with_kanji/config/app_constants.dart';

ThemeData buildTheme(ColorScheme? scheme, Color? primaryColor, bool isLight) =>
    ThemeData(
      brightness: isLight ? Brightness.light : Brightness.dark,
      useMaterial3: true,
      colorScheme: primaryColor != null ? null : scheme,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
          statusBarBrightness: !isLight ? Brightness.dark : Brightness.light,
        ),
      ),
      colorSchemeSeed: primaryColor ??
          (scheme == null ? AppConstants.fallbackPrimaryColor : null),
    );
