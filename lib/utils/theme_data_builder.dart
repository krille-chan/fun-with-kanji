import 'package:flutter/material.dart';
import 'package:fun_with_kanji/config/app_constants.dart';

ThemeData buildTheme(ColorScheme? scheme) => ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      colorSchemeSeed:
          scheme == null ? AppConstants.fallbackPrimaryColor : null,
    );
