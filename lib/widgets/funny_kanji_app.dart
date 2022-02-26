import 'package:flutter/material.dart';
import 'package:funny_kanji/config/app_constants.dart';
import 'package:funny_kanji/models/funny_kanji.dart';
import 'package:funny_kanji/pages/home/home_layout.dart';
import 'package:isar/isar.dart';
import 'package:yaru/yaru.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class FunnyKanjiApp extends StatelessWidget {
  final Isar isar;
  const FunnyKanjiApp({required this.isar, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: yaruLight,
      darkTheme: yaruDark,
      title: AppConstants.appName,
      home: const HomeLayout(),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      builder: FunnyKanji(isar).builder,
    );
  }
}
