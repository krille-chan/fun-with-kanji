import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;


import 'package:fun_with_kanji/models/kana.dart';
import 'package:fun_with_kanji/models/kanji.dart';
import 'package:fun_with_kanji/models/radical.dart';

import 'package:fun_with_kanji/generated/l10n.dart';

abstract class ScriptLoader {
  static Future<List<Kana>> loadHiragana() async {
    final jsonString = await rootBundle.loadString('assets/data/hiragana.json');
    return await compute(_convertToKana, jsonString);
  }

  static Future<List<Kana>> loadKatakana() async {
    final jsonString = await rootBundle.loadString('assets/data/katakana.json');
    return await compute(_convertToKana, jsonString);
  }

  static Future<List<Radical>> loadRadicals(
      BuildContext context, int level) async {
    final language = L10n.of(context)!.langPrefix;
    final jsonString = await rootBundle
        .loadString('assets/data/radicals${language}_$level.json');
    return await compute(_convertToRadicals, jsonString);
  }

  static Future<List<Kanji>> loadKanji(int level, BuildContext context) async {
    final language = L10n.of(context)!.langPrefix;

    if (level < 1 || level > 17) throw ('Level must be one of 1-6');
    final jsonString =
        await rootBundle.loadString('assets/data/kanji_$level$language.json');
    return await compute(_convertToKanji, jsonString);
  }

  static Future<List<Kana>> _convertToKana(String json) async {
    final list = jsonDecode(json) as List;
    return list.map((j) => Kana.fromJson(j)).toList();
  }

  static Future<List<Radical>> _convertToRadicals(String json) async {
    final list = jsonDecode(json) as List;
    return list.map((j) => Radical.fromJson(j)).toList();
  }

  static Future<List<Kanji>> _convertToKanji(String json) async {
    final list = jsonDecode(json) as List;
    return list.map((j) => Kanji.fromJson(j)).toList();
  }
}
