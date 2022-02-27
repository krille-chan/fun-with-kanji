// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:funny_kanji/models/funny_kanji.dart';
import 'package:funny_kanji/models/jp_character.dart';
import 'package:funny_kanji/models/learning_progress.dart';
import 'package:funny_kanji/models/script_loader.dart';
import 'package:funny_kanji/pages/learning/learning_view.dart';
import 'package:funny_kanji/utils/writing_system.dart';

class LearningPage extends StatefulWidget {
  final WritingSystem writingSystem;
  const LearningPage({required this.writingSystem, Key? key}) : super(key: key);

  @override
  LearningController createState() => LearningController();
}

class LearningController extends State<LearningPage> {
  JpCharacter? get currentCharacter => characterSet?[_currentId];
  LearningProgress? learningProgress;
  int _currentId = 0;
  List<JpCharacter>? characterSet;
  List<JpCharacter>? choices;
  bool? answerCorrect;

  void _loadNextCharacter() async {
    if (characterSet == null) {
      log('Load writing system ${widget.writingSystem.name}...');
      switch (widget.writingSystem) {
        case WritingSystem.hiragana:
          characterSet = await ScriptLoader.loadHiragana();
          break;
        case WritingSystem.katakana:
          characterSet = await ScriptLoader.loadKatakana();
          break;
        case WritingSystem.radicals:
          characterSet = await ScriptLoader.loadRadicals();
          break;
        case WritingSystem.kanji1:
          characterSet = await ScriptLoader.loadKanji(1);
          break;
        case WritingSystem.kanji2:
          characterSet = await ScriptLoader.loadKanji(2);
          break;
        case WritingSystem.kanji3:
          characterSet = await ScriptLoader.loadKanji(3);
          break;
        case WritingSystem.kanji4:
          characterSet = await ScriptLoader.loadKanji(4);
          break;
        case WritingSystem.kanji5:
          characterSet = await ScriptLoader.loadKanji(5);
          break;
        case WritingSystem.kanji6:
          characterSet = await ScriptLoader.loadKanji(6);
          break;
        case WritingSystem.kanji7:
          characterSet = await ScriptLoader.loadKanji(7);
          break;
        case WritingSystem.kanji8:
          characterSet = await ScriptLoader.loadKanji(8);
          break;
      }
    }

    log('Set current character and load learning progress...');
    final learningProgress = this.learningProgress =
        await FunnyKanji.of(context).getLearningProgress(
      widget.writingSystem,
      _currentId,
    );
    if (learningProgress.stars <= 5) {
      choices = [currentCharacter!];
      if (learningProgress.stars > 1) {
        // Add more choices
      }
    }
    setState(() {
      answerCorrect = null;
    });
  }

  void checkChoice(JpCharacter answer) async {
    final isCorrect = answer.toString() == currentCharacter.toString() &&
        answer.description == currentCharacter!.description;

    setState(() {
      if (isCorrect) {
        learningProgress!.stars++;
      } else {
        learningProgress!.stars--;
      }
      answerCorrect = isCorrect;
    });
    await FunnyKanji.of(context).setLearningProgress(
      widget.writingSystem,
      _currentId,
      learningProgress!.stars,
    );

    await Future.delayed(const Duration(milliseconds: 500));
    _loadNextCharacter();
  }

  @override
  void initState() {
    _loadNextCharacter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => LearningView(this);
}
