import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:fun_with_kanji/models/fun_with_kanji.dart';
import 'package:fun_with_kanji/widgets/fun_with_kanji_app.dart';

void main() async {
  log('Welcome to Funny Kanji');
  WidgetsFlutterBinding.ensureInitialized();
  final directory = kIsWeb
      ? null
      : Platform.isLinux
          ? await getApplicationSupportDirectory()
          : await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    schemas: FunWithKanji.isarSchemas,
    directory: directory?.path,
  );
  runApp(FunWithKanjiApp(isar: isar));
}
