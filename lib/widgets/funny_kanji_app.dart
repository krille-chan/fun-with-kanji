import 'package:flutter/material.dart';
import 'package:funny_kanji/config/app_constants.dart';
import 'package:funny_kanji/pages/home/home.dart';
import 'package:yaru/yaru.dart';

class FunnyKanjiApp extends StatelessWidget {
  const FunnyKanjiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: yaruLight,
      darkTheme: yaruDark,
      title: AppConstants.appName,
      home: const HomePage(),
    );
  }
}
