import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:funny_kanji/models/kana.dart';
import 'package:funny_kanji/models/kanji.dart';
import 'package:funny_kanji/models/radical.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class ScriptLoader {
  static Future<List<Kana>> loadHiragana() async {
    final jsonString = await rootBundle.loadString('assets/data/hiragana.json');
    return await compute(_convertToKana, jsonString);
  }

  static Future<List<Kana>> loadKatakana() async {
    final jsonString = await rootBundle.loadString('assets/data/katakana.json');
    return await compute(_convertToKana, jsonString);
  }

  static Future<List<Radical>> loadRadicals() async {
    final jsonString = await rootBundle.loadString('assets/data/radicals.json');
    return await compute(_convertToRadicals, jsonString);
  }

  static Future<List<Kanji>> loadKanji(int level) async {
    if (level < 1 || level > 9) throw ('Level must be one of 1-8');
    final jsonString =
        await rootBundle.loadString('assets/data/kanji_level_$level.json');
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
