import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fun_with_kanji/models/fun_with_kanji.dart';
import 'package:fun_with_kanji/widgets/fun_with_kanji_app.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:developer';

void main() async {
  log('Welcome to Funny Kanji');
  WidgetsFlutterBinding.ensureInitialized();
  final directory = Platform.isLinux
      ? await getApplicationSupportDirectory()
      : await getApplicationDocumentsDirectory();
  log('Open Isar in Directory ${directory.path}');
  final isar = await Isar.open(
    schemas: FunWithKanji.isarSchemas,
    directory: directory.path,
  );
  runApp(FunWithKanjiApp(isar: isar));
}
