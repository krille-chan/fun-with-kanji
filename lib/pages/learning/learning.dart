// ignore_for_file: prefer_final_fields

import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:fun_with_kanji/models/fun_with_kanji.dart';
import 'package:fun_with_kanji/models/jp_character.dart';
import 'package:fun_with_kanji/models/learning_progress.dart';
import 'package:fun_with_kanji/models/script_loader.dart';
import 'package:fun_with_kanji/pages/learning/learning_view.dart';
import 'package:fun_with_kanji/utils/open_issue_dialog.dart';
import 'package:fun_with_kanji/utils/writing_system.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

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
    try {
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

      // Update finished counter
      finished =
          await FunWithKanji.of(context).getFinishedCount(widget.writingSystem);

      _currentId = await _loadNextCharacterId();
      final learningProgress = this.learningProgress =
          await FunWithKanji.of(context).getLearningProgress(
        widget.writingSystem,
        _currentId,
      );
      if (learningProgress.stars <= 5) {
        choices = [currentCharacter!];
        if (learningProgress.stars > 0) {
          // Add more choices
          final possibleChoices = await FunWithKanji.of(context).getChoices(
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
    } catch (e, s) {
      showOpenIssueDialog(context, e, s);
      rethrow;
    }
  }

  Future<int> _loadNextCharacterId() async {
    try {
      final learnInProgressChars = await FunWithKanji.of(context)
          .getLearnInProgressCharacters(widget.writingSystem);
      final learnInProgressCharsLength = learnInProgressChars.length;
      learnInProgressChars.removeWhere((p) => p.characterId == _currentId);

      // Add new learn in progress character
      if (learnInProgressCharsLength < 4) {
        final nextId = await FunWithKanji.of(context).getNextLearnCharacter(
          widget.writingSystem,
        );
        if (nextId == characterSet!.length && learnInProgressChars.isEmpty) {
          dev.log('All characters at 10 stars. Pick random one!');
          return Random().nextInt(characterSet!.length);
        } else if (nextId < characterSet!.length) {
          dev.log('Add new character with ID $nextId...');
          return nextId;
        }
      }

      // Every 7th character should be repeating an old one:
      final repeatOldCharacter = Random().nextInt(7) == 0;

      if (repeatOldCharacter) {
        final learnedChars =
            await FunWithKanji.of(context).getLearnedCharacters(
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
      learnInProgressChars.shuffle();
      return learnInProgressChars.first.characterId;
    } catch (e, s) {
      showOpenIssueDialog(context, e, s);
      rethrow;
    }
  }

  void checkStringChoice() {
    responseController.text = responseController.text.toLowerCase().trim();
    if (currentCharacter!.description.contains(', ')) {
      _check(currentCharacter!.description
          .toLowerCase()
          .trim()
          .split(', ')
          .toSet()
          .contains(responseController.text));
      return;
    }
    _check(responseController.text.toLowerCase().trim() ==
        currentCharacter!.description.toLowerCase().trim());
  }

  void checkChoice(JpCharacter answer) {
    _check(answer.description == currentCharacter!.description);
  }

  void _check(bool isCorrect) async {
    // Display correct in text field:
    responseController.text = currentCharacter!.description;

    // Display feedback:
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isCorrect
                ? learningProgress!.stars == 9
                    ? L10n.of(context)!.allStarsWon
                    : '+1'
                : '-1',
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
        Audio(
            "assets/sounds/${isCorrect ? learningProgress!.stars == 9 ? 'tenstars' : 'correct' : 'wrong'}.mp3"),
        autoStart: true,
        showNotification: true,
      );
    }
    setState(() {
      if (isCorrect && learningProgress!.stars < 10) {
        learningProgress!.stars++;
      } else if (!isCorrect && learningProgress!.stars > 0) {
        learningProgress!.stars--;
      }
      answerCorrect = isCorrect;
    });
    await FunWithKanji.of(context).setLearningProgress(
      widget.writingSystem,
      _currentId,
      learningProgress!.stars,
    );

    await Future.delayed(const Duration(milliseconds: 500));
    _loadNextCharacter();
  }

  int finished = 0;

  @override
  void initState() {
    _loadNextCharacter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => LearningView(this);
}
