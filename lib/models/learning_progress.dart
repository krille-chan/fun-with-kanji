import 'dart:math';

import 'package:isar/isar.dart';

import 'package:fun_with_kanji/utils/writing_system.dart';

part 'learning_progress.g.dart';

@Collection()
class LearningProgress {
  int id = Isar.autoIncrement;

  String writingSystem = WritingSystem.hiragana.name;
  int characterId = 0;
  int stars = 0;
  DateTime? lastCheckedAt;

  static const int levelUpWaitingHours = 2;

  static const int maxStarsWithoutCooldown = 3;

  Duration get waitingTime => Duration(
        hours: pow(levelUpWaitingHours, stars - maxStarsWithoutCooldown + 1)
            .round(),
      );

  bool get canLevelUp {
    if (stars < maxStarsWithoutCooldown) return true;
    final lastCheckedAt = this.lastCheckedAt;
    if (lastCheckedAt == null) return true;

    return DateTime.now().difference(lastCheckedAt) > waitingTime;
  }
}
