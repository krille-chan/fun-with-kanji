import 'dart:io';

import 'package:flutter/material.dart';
import 'package:funny_kanji/models/funny_kanji.dart';
import 'package:funny_kanji/widgets/funny_kanji_app.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await Isar.open(
    schemas: FunnyKanji.isarSchemas,
    directory:
        Platform.isLinux ? (await getApplicationSupportDirectory()).path : null,
  );
  runApp(FunnyKanjiApp(isar: isar));
}
