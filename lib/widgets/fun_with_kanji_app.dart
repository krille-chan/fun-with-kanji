import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fun_with_kanji/config/app_constants.dart';
import 'package:fun_with_kanji/models/fun_with_kanji.dart';
import 'package:fun_with_kanji/pages/home/home_layout.dart';
import 'package:isar/isar.dart';
import 'package:yaru/yaru.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class FunWithKanjiApp extends StatelessWidget {
  final Isar isar;
  const FunWithKanjiApp({required this.isar, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: yaruLight.copyWith(
        appBarTheme: yaruLight.appBarTheme.copyWith(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      darkTheme: yaruDark.copyWith(
        appBarTheme: yaruDark.appBarTheme.copyWith(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      title: AppConstants.appName,
      home: const HomeLayout(),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      builder: FunWithKanji(isar).builder,
    );
  }
}
