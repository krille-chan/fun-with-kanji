import 'package:flutter/material.dart';
import 'package:funny_kanji/pages/learning/learning.dart';

class LearningView extends StatelessWidget {
  final LearningController controller;
  const LearningView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
