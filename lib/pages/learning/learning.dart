// ignore_for_file: prefer_final_fields

import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_to_speech/text_to_speech.dart';

import 'package:fun_with_kanji/config/config_keys.dart';
import 'package:fun_with_kanji/models/fun_with_kanji.dart';
import 'package:fun_with_kanji/models/jp_character.dart';
import 'package:fun_with_kanji/models/learning_progress.dart';
import 'package:fun_with_kanji/models/script_loader.dart';
import 'package:fun_with_kanji/pages/learning/learning_view.dart';
import 'package:fun_with_kanji/utils/open_issue_dialog.dart';
import 'package:fun_with_kanji/utils/writing_system.dart';

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
  late final bool enterRomaji;
  LearningProgress? learningProgress;
  int _currentId = 0;
  List<JpCharacter>? characterSet;
  List<JpCharacter>? choices;
  bool? answerCorrect;
  String? hint;
  bool showHint = false;

  TextToSpeech? tts;

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
          case WritingSystem.radicals1:
            characterSet = await ScriptLoader.loadRadicals(context, 1);
            break;
          case WritingSystem.radicals2:
            characterSet = await ScriptLoader.loadRadicals(context, 2);
            break;
          case WritingSystem.kanji1:
            characterSet = await ScriptLoader.loadKanji(1, context);
            break;
          case WritingSystem.kanji2:
            characterSet = await ScriptLoader.loadKanji(2, context);
            break;
          case WritingSystem.kanji3:
            characterSet = await ScriptLoader.loadKanji(3, context);
            break;
          case WritingSystem.kanji4:
            characterSet = await ScriptLoader.loadKanji(4, context);
            break;
          case WritingSystem.kanji5:
            characterSet = await ScriptLoader.loadKanji(5, context);
            break;
          case WritingSystem.kanji6:
            characterSet = await ScriptLoader.loadKanji(6, context);
            break;
          case WritingSystem.kanji7:
            characterSet = await ScriptLoader.loadKanji(7, context);
            break;
          case WritingSystem.kanji8:
            characterSet = await ScriptLoader.loadKanji(8, context);
            break;
          case WritingSystem.kanji9:
            characterSet = await ScriptLoader.loadKanji(9, context);
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
      if (learningProgress.stars <= 5 || !enterRomaji) {
        choices = [currentCharacter!];
        if (learningProgress.stars > 0) {
          // Add more choices
          final possibleChoices = await FunWithKanji.of(context).getChoices(
            widget.writingSystem,
            learningProgress.stars - 1,
            learningProgress.characterId,
            choicesCount: learningProgress.stars <= 5 ? 2 : 4,
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
      final hint = await FunWithKanji.of(context).loadHint(
        widget.writingSystem,
        learningProgress.characterId,
      );
      setState(() {
        answerCorrect = null;
        this.hint = hint;
        showHint = learningProgress.stars < 8;
      });
      if (choices == null) {
        replyFocus.requestFocus();
      }
    } catch (e, s) {
      showOpenIssueDialog(context, e, s);
      rethrow;
    }
  }

  void editHint() async {
    if (showHint == false) {
      setState(() {
        showHint = true;
      });
      return;
    }
    final newHint = await showDialog<String>(
      context: context,
      builder: (context) {
        final textController = TextEditingController(text: hint);
        return AlertDialog(
          title: Text(L10n.of(context)!.addHint),
          content: TextField(
            controller: textController,
            maxLength: 200,
            minLines: 2,
            maxLines: 4,
            decoration: InputDecoration(
                hintText: L10n.of(context)!.looksLikeAManWithAHat),
          ),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: Text(L10n.of(context)!.cancel),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pop<String>(textController.text),
              child: Text(L10n.of(context)!.save),
            ),
          ],
        );
      },
    );
    if (newHint == null) return;
    setState(() {
      hint = newHint;
    });
    await FunWithKanji.of(context).setHint(
      widget.writingSystem,
      learningProgress!.characterId,
      newHint,
    );
  }

  Future<int> _loadNextCharacterId() async {
    try {
      final learnInProgressChars = await FunWithKanji.of(context)
          .getLearnInProgressCharacters(widget.writingSystem);
      final learnInProgressCharsLength = learnInProgressChars.length;
      learnInProgressChars.removeWhere((p) => p.characterId == _currentId);

      // Add new learn in progress character
      if (learnInProgressCharsLength < 5) {
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

      // Every 5th character should be repeating an old one:
      final repeatOldCharacter = Random().nextInt(4) == 0;

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
    final response = responseController.text.toLowerCase().trim();
    final correctAnswer = currentCharacter!.correctAnswers
        .map((s) => s.trim().toLowerCase())
        .toSet();

    // Only one of the comma separated values needs to be the response
    _check(correctAnswer.contains(response));
  }

  void checkChoice(JpCharacter answer) {
    final correctAnswer = currentCharacter!.correctAnswers;
    _check(answer == currentCharacter ||
        correctAnswer.contains(answer.description.trim().toLowerCase()));
  }

  AudioPlayer? _audioPlayer;

  void _check(bool isCorrect) async {
    // Display correct in text field:
    responseController.text = currentCharacter!.correctAnswers.join('/');

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
            isCorrect ? Icons.star : Icons.star_outlined,
            color: isCorrect ? Colors.green : Colors.blueGrey,
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: isCorrect ? 750 : 2250),
    ));

    // Play sound:
    if (!Platform.isLinux) {
      await _audioPlayer?.setAsset(
          "assets/sounds/${isCorrect ? learningProgress!.stars == 9 ? 'finished' : 'correct' : 'wrong'}.mp3");
      _audioPlayer?.play();
      final tts = this.tts;
      if (tts != null) {
        tts.setLanguage('ja-JP');
        tts.speak(currentCharacter!.toTtsString());
      }
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

    await Future.delayed(Duration(milliseconds: isCorrect ? 500 : 2000));
    if (mounted) _loadNextCharacter();
  }

  int finished = 0;

  void _initTts() async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.getBool(ConfigKeys.playSoundEffects) != false) {
      _audioPlayer = AudioPlayer();
    }
    if (preferences.getBool(ConfigKeys.readOutLoud) != false &&
        !Platform.isLinux) {
      tts = TextToSpeech();
      if ({
        WritingSystem.hiragana,
        WritingSystem.katakana,
      }.contains(widget.writingSystem)) {
        tts?.setRate(0.5);
      }
    }

    enterRomaji = preferences.getBool(ConfigKeys.enterRomaji) ?? true;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadNextCharacter();
    });
    _initTts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => LearningView(this);
}
