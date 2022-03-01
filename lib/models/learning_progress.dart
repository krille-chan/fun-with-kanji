import 'package:fun_with_kanji/utils/writing_system.dart';
import 'package:isar/isar.dart';

part 'learning_progress.g.dart';

@Collection()
class LearningProgress {
  int id = Isar.autoIncrement;

  String writingSystem = WritingSystem.hiragana.name;
  int characterId = 0;
  int stars = 0;
}
