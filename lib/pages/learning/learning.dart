// ignore_for_file: prefer_final_fields

import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:funny_kanji/models/funny_kanji.dart';
import 'package:funny_kanji/models/jp_character.dart';
import 'package:funny_kanji/models/learning_progress.dart';
import 'package:funny_kanji/models/script_loader.dart';
import 'package:funny_kanji/pages/learning/learning_view.dart';
import 'package:funny_kanji/utils/writing_system.dart';
import 'package:yaru_icons/yaru_icons.dart';

class LearningPage extends StatefulWidget {
  final WritingSystem writingSystem;
  const LearningPage({required this.writingSystem, Key? key}) : super(key: key);

  @override
  LearningController createState() => LearningController();
}

class LearningController extends State<LearningPage> {
  JpCharacter? get currentCharacter => characterSet?[_currentId];
  final TextEditingController responseController = TextEditingController();
  final FocusNode replyFocus = FocusNode();
  LearningProgress? learningProgress;
  int _currentId = 0;
  List<JpCharacter>? characterSet;
  List<JpCharacter>? choices;
  bool? answerCorrect;

  void _loadNextCharacter() async {
    if (characterSet == null) {
      dev.log('Load writing system ${widget.writingSystem.name}...');
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

    _currentId = await _loadNextCharacterId();
    final learningProgress = this.learningProgress =
        await FunnyKanji.of(context).getLearningProgress(
      widget.writingSystem,
      _currentId,
    );
    if (learningProgress.stars <= 5) {
      choices = [currentCharacter!];
      if (learningProgress.stars > 0) {
        // Add more choices
        final possibleChoices = await FunnyKanji.of(context).getChoices(
          widget.writingSystem,
          learningProgress.stars - 1,
          learningProgress.characterId,
        );
        choices?.addAll(
          possibleChoices.map(
            (learningProgress) => characterSet![learningProgress.characterId],
          ),
        );
        if (choices!.length < 3) {
          throw ('No choices found. This should not happen!');
        }
        choices?.shuffle();
      }
    } else {
      choices = null;
    }
    responseController.clear();
    setState(() {
      answerCorrect = null;
    });
    if (choices == null) {
      replyFocus.requestFocus();
    }
  }

  Future<int> _loadNextCharacterId() async {
    final learnInProgressChars = await FunnyKanji.of(context)
        .getLearnInProgressCharacters(widget.writingSystem);

    // Add new learn in progress character
    if (learnInProgressChars.length < 4) {
      final nextId = await FunnyKanji.of(context).getNextLearnCharacter(
        widget.writingSystem,
      );
      if (nextId == characterSet!.length - 1) {
        dev.log('All characters at 10 stars. Pick random one!');
        return Random().nextInt(characterSet!.length);
      }
      dev.log('Add new character with ID $nextId...');
      return nextId;
    }

    // Every 7th character should be repeating an old one:
    final repeatOldCharacter = Random().nextInt(7) == 0;

    if (repeatOldCharacter) {
      final learnedChars = await FunnyKanji.of(context).getLearnedCharacters(
        widget.writingSystem,
      );
      if (learnedChars.isNotEmpty &&
          !(learnedChars.length == 1 &&
              learnedChars.single.characterId == _currentId)) {
        dev.log('Repeat one of the 10 stars characters...');
        learnedChars.shuffle();
        return learnedChars.first.characterId;
      }
    }

    dev.log(
        'Continue with one of ${learnInProgressChars.length} learn-in-progress characters...');
    learnInProgressChars.removeWhere((p) => p.characterId == _currentId);
    learnInProgressChars.shuffle();
    return learnInProgressChars.first.characterId;
  }

  void checkStringChoice() {
    _check(responseController.text.toLowerCase().trim() ==
        currentCharacter!.description.toLowerCase().trim());
  }

  void checkChoice(JpCharacter answer) {
    final isCorrect = answer.toString() == currentCharacter.toString() &&
        answer.description == currentCharacter!.description;
    _check(isCorrect);
  }

  void _check(bool isCorrect) async {
    // Display feedback:
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isCorrect ? '+1' : '-1',
            style: TextStyle(
              color: isCorrect ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            isCorrect ? YaruIcons.star_filled : YaruIcons.star,
            color: isCorrect ? Colors.green : Colors.blueGrey,
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 750),
    ));

    // Play sound:
    if (!Platform.isLinux) {
      AssetsAudioPlayer.newPlayer().open(
        Audio("assets/sounds/${isCorrect ? 'correct' : 'wrong'}.mp3"),
        autoStart: true,
        showNotification: true,
      );
    }
    setState(() {
      if (isCorrect && learningProgress!.stars < 10) {
        learningProgress!.stars++;
      } else if (learningProgress!.stars > 0) {
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
