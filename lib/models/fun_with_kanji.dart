import 'package:flutter/material.dart';

import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import 'package:fun_with_kanji/models/kanji_hint.dart';
import 'package:fun_with_kanji/models/learning_progress.dart';
import 'package:fun_with_kanji/utils/writing_system.dart';

class FunWithKanji {
  final Isar isar;

  FunWithKanji(this.isar);

  static const int maxStars = 10;
  static const int hiraganaMax = 105 * maxStars;
  static const int katakanaMax = 105 * maxStars;
  static const int radicalsMax = 229 * maxStars;
  static const int kanjiMax = 267 * maxStars;

  static List<CollectionSchema<dynamic>> get isarSchemas => [
        LearningProgressSchema,
        KanjiHintSchema,
      ];

  Stream<void> get onChanges => isar.learningProgress.watchLazy();

  Widget builder(BuildContext context, Widget? child) => Provider<FunWithKanji>(
        create: (_) => this,
        child: child,
      );

  static FunWithKanji of(BuildContext context) => Provider.of<FunWithKanji>(
        context,
        listen: false,
      );

  Future<int> loadProgressPercent(WritingSystem system) async =>
      (((await isar.learningProgress
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
      (await isar.learningProgress
              .filter()
              .writingSystemEqualTo(system.name)
              .and()
              .characterIdEqualTo(id)
              .findFirst()) ??
          LearningProgress()
        ..characterId = id
        ..writingSystem = system.name;

  Future<int> getFinishedCount(WritingSystem system) => isar.learningProgress
      .filter()
      .writingSystemEqualTo(system.name)
      .and()
      .starsEqualTo(10)
      .count();

  Future<Set<LearningProgress>> getChoices(
    WritingSystem system,
    int stars,
    int characterId, {
    int choicesCount = 2,
  }) async {
    var available = await isar.learningProgress
        .filter()
        .writingSystemEqualTo(system.name)
        .and()
        .not()
        .characterIdEqualTo(characterId)
        .findAll();
    available.shuffle();
    return available.take(choicesCount).toSet();
  }

  Future<List<LearningProgress>> getLearnInProgressCharacters(
    WritingSystem system,
  ) =>
      isar.learningProgress
          .filter()
          .writingSystemEqualTo(system.name)
          .and()
          .starsLessThan(10)
          .findAll();

  Future<int> getNextLearnCharacter(WritingSystem system) async {
    final nextId = (await isar.learningProgress
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
      isar.learningProgress
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
      isar.writeTxn(() async {
        final progress = await isar.learningProgress
                .filter()
                .writingSystemEqualTo(system.name)
                .and()
                .characterIdEqualTo(id)
                .findFirst() ??
            LearningProgress()
          ..characterId = id
          ..writingSystem = system.name;
        progress.stars = stars;
        progress.lastCheckedAt = DateTime.now();
        await isar.learningProgress.put(progress);
      });

  Future<void> resetLearningProgress() => isar.writeTxn(() => isar.clear());

  Future<void> resetLearningProgressForSystem(WritingSystem system) =>
      isar.writeTxn(
        () => isar.learningProgress
            .filter()
            .writingSystemEqualTo(system.name)
            .deleteAll(),
      );

  Future<String?> loadHint(WritingSystem system, int id) => isar.kanjiHints
      .filter()
      .writingSystemEqualTo(system.name)
      .and()
      .characterIdEqualTo(id)
      .findFirst()
      .then((hint) => hint?.hint);

  Future<void> setHint(
    WritingSystem system,
    int id,
    String hintText,
  ) =>
      isar.writeTxn(() async {
        final hint = await isar.kanjiHints
                .filter()
                .writingSystemEqualTo(system.name)
                .and()
                .characterIdEqualTo(id)
                .findFirst() ??
            KanjiHint()
          ..characterId = id
          ..writingSystem = system.name;
        hint.hint = hintText;
        await isar.kanjiHints.put(hint);
      });

  Future<Map<String, dynamic>> export() async => {
        'learningProgress': await isar.learningProgress
            .filter()
            .starsGreaterThan(0)
            .exportJson(),
        'hints':
            await isar.kanjiHints.filter().not().hintEqualTo('').exportJson(),
      };

  Future<void> import(Map<String, dynamic> json) async {
    isar.writeTxn(() async {
      await isar.learningProgress.importJson(
          List<Map<String, dynamic>>.from(json['learningProgress']));
    });
    isar.writeTxn(() async {
      await isar.kanjiHints
          .importJson(List<Map<String, dynamic>>.from(json['hints']));
    });
  }
}
