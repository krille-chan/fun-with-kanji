import 'package:flutter/material.dart';
import 'package:funny_kanji/models/kana.dart';
import 'package:funny_kanji/pages/learning/learning.dart';
import 'package:funny_kanji/utils/writing_system.dart';
import 'package:yaru_icons/yaru_icons.dart';

class LearningView extends StatelessWidget {
  final LearningController controller;
  const LearningView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.widget.writingSystem.getTitle(context)),
      ),
      body: Builder(builder: (context) {
        final currentCharacter = controller.currentCharacter;
        final learningProgress = controller.learningProgress;
        if (currentCharacter == null || learningProgress == null) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        final choices = controller.choices;
        return ListView(padding: const EdgeInsets.all(16), children: [
          Row(
            children: [
              for (var i = 1; i <= 10; i++)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      learningProgress.stars >= i
                          ? YaruIcons.star_filled
                          : YaruIcons.star,
                      color: learningProgress.stars >= i
                          ? Colors.yellow.shade600
                          : Colors.grey,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: CircleAvatar(
              radius: 94,
              child: Text(
                currentCharacter.toString(),
                style: const TextStyle(fontSize: 94),
              ),
            ),
          ),
          if (currentCharacter is Kana) ...[
            const SizedBox(height: 16),
            Center(
              child: Text(currentCharacter.type),
            )
          ],
          const SizedBox(height: 16),
          if (choices != null)
            ...choices.map(
              (choice) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: () => controller.checkChoice(choice),
                  style: ElevatedButton.styleFrom(
                    primary: controller.answerCorrect == true &&
                            choice == currentCharacter
                        ? Colors.green.shade700
                        : Colors.blueGrey,
                    elevation: 7,
                    padding: const EdgeInsets.all(8),
                  ),
                  child: Text(
                    choice.description,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
        ]);
      }),
    );
  }
}
