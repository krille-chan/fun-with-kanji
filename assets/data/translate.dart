// ignore_for_file: avoid_print
/*
import 'dart:convert';
import 'dart:io';

import 'package:fun_with_kanji/models/kanji.dart';
import 'package:translator/translator.dart';

void main() async {
  final translator = GoogleTranslator();
  const lang = 'de';

  for (var level = 1; level < 10; level++) {
    print('Start with level $level');

    final file = File('./kanji_$level.json');
    final fileContent = await file.readAsString();
    final fileContentJson = jsonDecode(fileContent) as List;
    final kanjiList =
        fileContentJson.map((json) => Kanji.fromJson(json)).toList();
    for (final kanji in kanjiList) {
      for (var i = 0; i < kanji.meanings.length; i++) {
        print('Translate ${kanji.kanji} meaning ${kanji.meanings[i]}...');
        final textResult = await translator.translate(
          kanji.meanings[i],
          from: 'en',
          to: lang,
        );
        kanji.meanings[i] = textResult.text;
        print('Translated to: ${textResult.text}');
      }
    }
    print('Write output to new file');
    final outputFile = File('./kanji_${level}_$lang.json');
    await outputFile.writeAsString(
      jsonEncode(kanjiList.map((kanji) => kanji.toJson()).toList()),
    );
  }
}
*/