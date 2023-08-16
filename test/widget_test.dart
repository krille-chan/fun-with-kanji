// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

import 'package:fun_with_kanji/models/fun_with_kanji.dart';
import 'package:fun_with_kanji/widgets/fun_with_kanji_app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();
    final isar = await Isar.open(
      FunWithKanji.isarSchemas,
      directory: './',
    );
    await tester.pumpWidget(FunWithKanjiApp(isar: isar));
  });
}
