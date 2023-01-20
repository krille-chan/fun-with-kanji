import 'package:isar/isar.dart';

import 'package:fun_with_kanji/utils/writing_system.dart';

part 'kanji_hint.g.dart';

@Collection()
class KanjiHint {
  int id = Isar.autoIncrement;

  String writingSystem = WritingSystem.hiragana.name;
  int characterId = 0;
  String hint = '';
}
