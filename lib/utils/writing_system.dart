import 'package:flutter/cupertino.dart';

import 'package:fun_with_kanji/generated/l10n.dart';

enum WritingSystem {
  hiragana,
  katakana,
  kanji1,
  kanji2,
  kanji3,
  kanji4,
  kanji5,
  kanji6,
  kanji7,
  kanji8,
  kanji9,
  radicals1,
  radicals2,
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
        return '引';
      case WritingSystem.kanji3:
        return '悪';
      case WritingSystem.kanji4:
        return '愛';
      case WritingSystem.kanji5:
        return '圧';
      case WritingSystem.kanji6:
        return '異';
      case WritingSystem.kanji7:
        return '亜';
      case WritingSystem.kanji8:
        return '撮';
      case WritingSystem.kanji9:
        return '迭';
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
        return L10n.of(context)!.kanjiPrimarySchoolClass(1);
      case WritingSystem.kanji2:
        return L10n.of(context)!.kanjiPrimarySchoolClass(2);
      case WritingSystem.kanji3:
        return L10n.of(context)!.kanjiPrimarySchoolClass(3);
      case WritingSystem.kanji4:
        return L10n.of(context)!.kanjiPrimarySchoolClass(4);
      case WritingSystem.kanji5:
        return L10n.of(context)!.kanjiPrimarySchoolClass(5);
      case WritingSystem.kanji6:
        return L10n.of(context)!.kanjiPrimarySchoolClass(6);
      case WritingSystem.kanji7:
        return L10n.of(context)!.kanjiMiddleSchoolClass(1);
      case WritingSystem.kanji8:
        return L10n.of(context)!.kanjiMiddleSchoolClass(2);
      case WritingSystem.kanji9:
        return L10n.of(context)!.kanjiMiddleSchoolClass(3);
    }
  }

  int get entries {
    switch (this) {
      case WritingSystem.hiragana:
        return 104;
      case WritingSystem.katakana:
        return 104;
      case WritingSystem.radicals1:
        return 115;
      case WritingSystem.radicals2:
        return 114;
      case WritingSystem.kanji1:
        return 80;
      case WritingSystem.kanji2:
        return 160;
      case WritingSystem.kanji3:
        return 200;
      case WritingSystem.kanji4:
        return 200;
      case WritingSystem.kanji5:
        return 185;
      case WritingSystem.kanji6:
        return 181;
      case WritingSystem.kanji7:
        return 313;
      case WritingSystem.kanji8:
        return 309;
      case WritingSystem.kanji9:
        return 312;
    }
  }
}
