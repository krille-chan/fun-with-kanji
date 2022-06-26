import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

enum WritingSystem {
  hiragana,
  katakana,
  radicals1,
  radicals2,
  kanji1,
  kanji2,
  kanji3,
  kanji4,
  kanji5,
  kanji6,
  kanji7,
  kanji8,
  kanji9,
  kanji10,
  kanji11,
  kanji12,
  kanji13,
  kanji14,
  kanji15,
  kanji16,
}

extension WritingSystemSymbol on WritingSystem {
  String get symbol {
    switch (this) {
      case WritingSystem.hiragana:
        return 'ひ';
      case WritingSystem.katakana:
        return 'カ';
      case WritingSystem.radicals1:
        return '丶';
      case WritingSystem.radicals2:
        return '田';
      case WritingSystem.kanji1:
        return '一';
      case WritingSystem.kanji2:
        return '米';
      case WritingSystem.kanji3:
        return '所';
      case WritingSystem.kanji4:
        return '歯';
      case WritingSystem.kanji5:
        return '典';
      case WritingSystem.kanji6:
        return '産';
      case WritingSystem.kanji7:
        return '述';
      case WritingSystem.kanji8:
        return '撃';
      case WritingSystem.kanji9:
        return '訳';
      case WritingSystem.kanji10:
        return '刑';
      case WritingSystem.kanji11:
        return '儀';
      case WritingSystem.kanji12:
        return '井';
      case WritingSystem.kanji13:
        return '拘';
      case WritingSystem.kanji14:
        return '錦';
      case WritingSystem.kanji15:
        return '窃';
      case WritingSystem.kanji16:
        return '股';
    }
  }

  String getTitle(BuildContext context) {
    switch (this) {
      case WritingSystem.hiragana:
        return L10n.of(context)!.hiragana;
      case WritingSystem.katakana:
        return L10n.of(context)!.katakana;
      case WritingSystem.radicals1:
        return L10n.of(context)!.radicals(1);
      case WritingSystem.radicals2:
        return L10n.of(context)!.radicals(2);
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
      case WritingSystem.kanji9:
        return L10n.of(context)!.kanjiLevel(9);
      case WritingSystem.kanji10:
        return L10n.of(context)!.kanjiLevel(10);
      case WritingSystem.kanji11:
        return L10n.of(context)!.kanjiLevel(11);
      case WritingSystem.kanji12:
        return L10n.of(context)!.kanjiLevel(12);
      case WritingSystem.kanji13:
        return L10n.of(context)!.kanjiLevel(13);
      case WritingSystem.kanji14:
        return L10n.of(context)!.kanjiLevel(14);
      case WritingSystem.kanji15:
        return L10n.of(context)!.kanjiLevel(15);
      case WritingSystem.kanji16:
        return L10n.of(context)!.kanjiLevel(16);
    }
  }

  int get entries {
    switch (this) {
      case WritingSystem.hiragana:
        return 105;
      case WritingSystem.katakana:
        return 105;
      case WritingSystem.radicals1:
        return 114;
      case WritingSystem.radicals2:
        return 114;
      case WritingSystem.kanji1:
        return 134;
      case WritingSystem.kanji2:
        return 133;
      case WritingSystem.kanji3:
        return 134;
      case WritingSystem.kanji4:
        return 133;
      case WritingSystem.kanji5:
        return 134;
      case WritingSystem.kanji6:
        return 133;
      case WritingSystem.kanji7:
        return 134;
      case WritingSystem.kanji8:
        return 133;
      case WritingSystem.kanji9:
        return 134;
      case WritingSystem.kanji10:
        return 133;
      case WritingSystem.kanji11:
        return 134;
      case WritingSystem.kanji12:
        return 133;
      case WritingSystem.kanji13:
        return 134;
      case WritingSystem.kanji14:
        return 133;
      case WritingSystem.kanji15:
        return 134;
      case WritingSystem.kanji16:
        return 133;
    }
  }
}
