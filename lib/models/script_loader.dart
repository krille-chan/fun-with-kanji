import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:funny_kanji/models/kana.dart';
import 'package:funny_kanji/models/kanji.dart';
import 'package:funny_kanji/models/radical.dart';

abstract class ScriptLoader {
  static Future<List<Kana>> loadHiragana() async {
    final file = File('assets/data/hiragana.json');
    final jsonString = await file.readAsString();
    return await compute(_convertToKana, jsonString);
  }

  static Future<List<Kana>> loadKatakana() async {
    final file = File('assets/data/katakana.json');
    final jsonString = await file.readAsString();
    return await compute(_convertToKana, jsonString);
  }

  static Future<List<Radical>> loadRadicals() async {
    final file = File('assets/data/radicals.json');
    final jsonString = await file.readAsString();
    return await compute(_convertToRadicals, jsonString);
  }

  static Future<List<Kanji>> loadKanji(int level) async {
    if (level < 1 || level > 5) throw ('Level must be one of 1-4');
    final file = File('assets/data/level_$level.json');
    final jsonString = await file.readAsString();
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
