import 'package:flutter/material.dart';
import 'package:fun_with_kanji/models/kana.dart';
import 'package:fun_with_kanji/models/kanji.dart';
import 'package:fun_with_kanji/pages/learning/learning.dart';
import 'package:fun_with_kanji/utils/writing_system.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class LearningView extends StatelessWidget {
  final LearningController controller;
  const LearningView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.widget.writingSystem.getTitle(context)),
        actions: [
          Center(
            child: Text(
              L10n.of(context)!.countFinished(controller.finished),
            ),
          ),
          const SizedBox(width: 4),
          const Icon(YaruIcons.checkmark),
          const SizedBox(width: 4),
        ],
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
          SizedBox(
            height: 188,
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: controller.answerCorrect == null ? 188 : 0,
                height: controller.answerCorrect == null ? 188 : 0,
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(256),
                  color: controller.answerCorrect == null
                      ? Colors.purple.shade700
                      : controller.answerCorrect!
                          ? Colors.green.shade700
                          : Colors.red.shade700,
                ),
                child: Center(
                  child: controller.answerCorrect != null
                      ? null
                      : SizedBox(
                          width: 156,
                          height: 156,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              currentCharacter.toString(),
                              style: const TextStyle(
                                  fontSize: 94, color: Colors.white),
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ),
          if (currentCharacter is Kana) ...[
            const SizedBox(height: 16),
            Text(
              currentCharacter.type,
              textAlign: TextAlign.center,
            ),
          ],
          if (currentCharacter is Kanji &&
              controller.learningProgress!.stars < 8) ...[
            const SizedBox(height: 16),
            Text(
              '${L10n.of(context)!.radicals}: ${currentCharacter.radicals.join(', ')}',
              textAlign: TextAlign.center,
            ),
          ],
          const SizedBox(height: 16),
          if (choices != null)
            ...choices.map(
              (choice) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: controller.answerCorrect != null
                      ? null
                      : () => controller.checkChoice(choice),
                  style: ElevatedButton.styleFrom(
                    primary: controller.answerCorrect != null
                        ? choice == currentCharacter
                            ? Colors.green.shade700
                            : controller.answerCorrect == false
                                ? Colors.red.shade700
                                : Colors.blueGrey
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
            )
          else ...[
            TextField(
              readOnly: controller.answerCorrect != null,
              controller: controller.responseController,
              focusNode: controller.replyFocus,
              autofocus: true,
              autocorrect: false,
              enableSuggestions: false,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => controller.checkStringChoice(),
              decoration:
                  InputDecoration(hintText: L10n.of(context)!.enterRomaji),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.answerCorrect != null
                  ? null
                  : controller.checkStringChoice,
              style: ElevatedButton.styleFrom(
                primary: controller.answerCorrect != null
                    ? controller.answerCorrect!
                        ? Colors.green.shade700
                        : Colors.red.shade700
                    : Colors.blueGrey,
                elevation: 7,
                padding: const EdgeInsets.all(8),
              ),
              child: Text(
                L10n.of(context)!.check,
                style: const TextStyle(fontSize: 24),
              ),
            )
          ],
          if (currentCharacter is Kanji &&
              (controller.learningProgress!.stars < 8 ||
                  controller.answerCorrect != null)) ...[
            const Divider(),
            Text(
              '${L10n.of(context)!.onReadings}\n${currentCharacter.readingsOn.join('\n')}',
              style: const TextStyle(fontSize: 16),
            ),
            const Divider(),
            Text(
              '${L10n.of(context)!.kunReadings}\n${currentCharacter.readingsKun.join('\n')}',
              style: const TextStyle(fontSize: 16),
            ),
            const Divider(),
          ]
        ]);
      }),
    );
  }
}
