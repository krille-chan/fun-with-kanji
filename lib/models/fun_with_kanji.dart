import 'package:flutter/material.dart';
import 'package:fun_with_kanji/models/learning_progress.dart';
import 'package:fun_with_kanji/utils/writing_system.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class FunWithKanji {
  final Isar isar;

  FunWithKanji(this.isar);

  static const int maxStars = 10;
  static const int hiraganaMax = 199 * maxStars;
  static const int katakanaMax = 105 * maxStars;
  static const int radicalsMax = 232 * maxStars;
  static const int kanjiMax = 267 * maxStars;

  static List<CollectionSchema<dynamic>> get isarSchemas => [
        LearningProgressSchema,
      ];

  Stream<void> get onChanges => isar.learningProgresss.watchLazy();

  Widget builder(BuildContext context, Widget? child) => Provider<FunWithKanji>(
        create: (_) => this,
        child: child,
      );

  static FunWithKanji of(BuildContext context) => Provider.of<FunWithKanji>(
        context,
        listen: false,
      );

  Future<int> loadProgressPercent(WritingSystem system) async =>
      (((await isar.learningProgresss
                      .filter()
                      .writingSystemEqualTo(system.name)
                      .starsProperty()
                      .sum()) /
                  10) /
              system.entries *
              100)
          .round();

  Future<LearningProgress> getLearningProgress(
          WritingSystem system, int id) async =>
      (await isar.learningProgresss
              .filter()
              .writingSystemEqualTo(system.name)
              .and()
              .characterIdEqualTo(id)
              .findFirst()) ??
          LearningProgress()
        ..characterId = id
        ..writingSystem = system.name;

  Future<int> getFinishedCount(WritingSystem system) => isar.learningProgresss
      .filter()
      .writingSystemEqualTo(system.name)
      .and()
      .starsEqualTo(10)
      .count();

  Future<Set<LearningProgress>> getChoices(
    WritingSystem system,
    int stars,
    int characterId,
  ) async {
    var available = await isar.learningProgresss
        .filter()
        .writingSystemEqualTo(system.name)
        .and()
        .not()
        .characterIdEqualTo(characterId)
        .findAll();
    available.shuffle();
    return available.take(2).toSet();
  }

  Future<List<LearningProgress>> getLearnInProgressCharacters(
    WritingSystem system,
  ) =>
      isar.learningProgresss
          .filter()
          .writingSystemEqualTo(system.name)
          .and()
          .starsLessThan(10)
          .findAll();

  Future<int> getNextLearnCharacter(WritingSystem system) async {
    final nextId = (await isar.learningProgresss
            .filter()
            .writingSystemEqualTo(system.name)
            .sortByCharacterIdDesc()
            .findFirst())
        ?.characterId;
    if (nextId == null) return 0;
    return nextId + 1;
  }

  Future<List<LearningProgress>> getLearnedCharacters(
    WritingSystem system,
  ) =>
      isar.learningProgresss
          .filter()
          .writingSystemEqualTo(system.name)
          .and()
          .starsEqualTo(10)
          .findAll();

  Future<void> setLearningProgress(
    WritingSystem system,
    int id,
    int stars,
  ) =>
      isar.writeTxn((_) async {
        final progress = await isar.learningProgresss
                .filter()
                .writingSystemEqualTo(system.name)
                .and()
                .characterIdEqualTo(id)
                .findFirst() ??
            LearningProgress()
          ..characterId = id
          ..writingSystem = system.name;
        progress.stars = stars;
        await isar.learningProgresss.put(progress);
      });

  Future<void> resetLearningProgress() => isar.writeTxn((_) => isar.clear());

  Future<List<Map<String, dynamic>>> export() =>
      isar.learningProgresss.filter().starsGreaterThan(0).exportJson();

  Future<void> import(List<Map<String, dynamic>> json) async {
    await isar.learningProgresss.clear();
    await isar.learningProgresss.importJson(json);
  }
}
