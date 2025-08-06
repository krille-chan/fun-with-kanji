import 'package:flutter/material.dart';

import 'package:fun_with_kanji/generated/l10n.dart';

extension ThemeModeToString on ThemeMode {
  String toLocalizedString(BuildContext context) {
    if (this == ThemeMode.light) {
      return L10n.of(context)!.light;
    }
    if (this == ThemeMode.dark) {
      return L10n.of(context)!.dark;
    }
    return L10n.of(context)!.system;
  }
}
