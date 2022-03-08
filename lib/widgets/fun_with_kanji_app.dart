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
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            systemNavigationBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
      darkTheme: yaruDark.copyWith(
        appBarTheme: yaruDark.appBarTheme.copyWith(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            systemNavigationBarColor: Colors.black,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
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
