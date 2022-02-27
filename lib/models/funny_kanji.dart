import 'package:flutter/material.dart';
import 'package:funny_kanji/models/learning_progress.dart';
import 'package:funny_kanji/utils/writing_system.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class FunnyKanji {
  final Isar isar;

  FunnyKanji(this.isar);

  static const int maxStars = 10;
  static const int hiraganaMax = 199 * maxStars;
  static const int katakanaMax = 105 * maxStars;
  static const int radicalsMax = 232 * maxStars;
  static const int kanjiMax = 267 * maxStars;

  static List<CollectionSchema<dynamic>> get isarSchemas => [
        LearningProgressSchema,
      ];

  Widget builder(BuildContext context, Widget? child) => Provider<FunnyKanji>(
        create: (_) => this,
        child: StreamBuilder<void>(
          stream: isar.learningProgresss.watchLazy(),
          builder: (context, snapshot) => child ?? Container(),
        ),
      );

  static FunnyKanji of(BuildContext context) => Provider.of<FunnyKanji>(
        context,
        listen: false,
      );

  Future<int> loadProgressPercent(WritingSystem system) async =>
      ((await isar.learningProgresss
                  .filter()
                  .writingSystemEqualTo(system.name)
                  .starsProperty()
                  .sum()) /
              hiraganaMax)
          .round();

  Future<LearningProgress> getLearningProgress(
          WritingSystem system, int id) async =>
      (await isar.learningProgresss
              .filter()
              .writingSystemEqualTo(system.name)
              .characterIdEqualTo(id)
              .findFirst()) ??
          LearningProgress()
        ..characterId = id
        ..writingSystem = system.name;

  Future<void> setLearningProgress(
    WritingSystem system,
    int id,
    int stars,
  ) =>
      isar.writeTxn((_) async {
        final progress = await isar.learningProgresss
                .filter()
                .writingSystemEqualTo(system.name)
                .characterIdEqualTo(id)
                .findFirst() ??
            LearningProgress()
          ..characterId = id
          ..writingSystem = system.name;
        progress.stars = stars;
        await isar.learningProgresss.put(progress);
      });
}
