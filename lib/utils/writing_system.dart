import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

enum WritingSystem {
  hiragana,
  katakana,
  radicals,
  kanji1,
  kanji2,
  kanji3,
  kanji4,
  kanji5,
  kanji6,
  kanji7,
  kanji8,
}

extension WritingSystemSymbol on WritingSystem {
  String get symbol {
    switch (this) {
      case WritingSystem.hiragana:
        return 'ひ';
      case WritingSystem.katakana:
        return 'カ';
      case WritingSystem.radicals:
        return 'ら';
      case WritingSystem.kanji1:
        return '一';
      case WritingSystem.kanji2:
        return '所';
      case WritingSystem.kanji3:
        return '典';
      case WritingSystem.kanji4:
        return '述';
      case WritingSystem.kanji5:
        return '訳';
      case WritingSystem.kanji6:
        return '儀';
      case WritingSystem.kanji7:
        return '拘';
      case WritingSystem.kanji8:
        return '窃';
    }
  }

  String getTitle(BuildContext context) {
    switch (this) {
      case WritingSystem.hiragana:
        return L10n.of(context)!.hiragana;
      case WritingSystem.katakana:
        return L10n.of(context)!.katakana;
      case WritingSystem.radicals:
        return L10n.of(context)!.radicals;
      case WritingSystem.kanji1:
        return L10n.of(context)!.kanjiLevel(1);
      case WritingSystem.kanji2:
        return L10n.of(context)!.kanjiLevel(2);
      case WritingSystem.kanji3:
        return L10n.of(context)!.kanjiLevel(3);
      case WritingSystem.kanji4:
        return L10n.of(context)!.kanjiLevel(4);
      case WritingSystem.kanji5:
        return L10n.of(context)!.kanjiLevel(5);
      case WritingSystem.kanji6:
        return L10n.of(context)!.kanjiLevel(6);
      case WritingSystem.kanji7:
        return L10n.of(context)!.kanjiLevel(7);
      case WritingSystem.kanji8:
        return L10n.of(context)!.kanjiLevel(8);
    }
  }

  int get entries {
    switch (this) {
      case WritingSystem.hiragana:
        return 199;
      case WritingSystem.katakana:
        return 105;
      case WritingSystem.radicals:
        return 232;
      case WritingSystem.kanji1:
        return 267;
      case WritingSystem.kanji2:
        return 267;
      case WritingSystem.kanji3:
        return 267;
      case WritingSystem.kanji4:
        return 267;
      case WritingSystem.kanji5:
        return 267;
      case WritingSystem.kanji6:
        return 267;
      case WritingSystem.kanji7:
        return 267;
      case WritingSystem.kanji8:
        return 267;
    }
  }
}
