import 'package:flutter/material.dart';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:fun_with_kanji/generated/l10n.dart';
import 'package:isar/isar.dart';

import 'package:fun_with_kanji/config/app_constants.dart';
import 'package:fun_with_kanji/models/fun_with_kanji.dart';
import 'package:fun_with_kanji/pages/home/home_layout.dart';
import 'package:fun_with_kanji/utils/theme_data_builder.dart';
import 'package:fun_with_kanji/widgets/theme_builder.dart';

class FunWithKanjiApp extends StatelessWidget {
  final Isar isar;
  const FunWithKanjiApp({required this.isar, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ThemeBuilder(
      builder: (context, themeMode, primaryColor) => DynamicColorBuilder(
            builder: (light, dark) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: buildTheme(light, primaryColor, true),
              darkTheme: buildTheme(dark, primaryColor, false),
              themeMode: themeMode,
              title: AppConstants.appName,
              home: const HomeLayout(),
              localizationsDelegates: L10n.localizationsDelegates,
              supportedLocales: L10n.supportedLocales,
              builder: FunWithKanji(isar).builder,
            ),
          ));
}
