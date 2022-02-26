import 'package:flutter/material.dart';
import 'package:funny_kanji/pages/learning/learning_view.dart';
import 'package:funny_kanji/utils/writing_system.dart';

class LearningPage extends StatefulWidget {
  final WritingSystem writingSystem;
  const LearningPage({required this.writingSystem, Key? key}) : super(key: key);

  @override
  LearningController createState() => LearningController();
}

class LearningController extends State<LearningPage> {
  @override
  Widget build(BuildContext context) => LearningView(this);
}
