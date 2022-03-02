import 'package:flutter/material.dart';
import 'package:fun_with_kanji/models/kanji.dart';
import 'package:fun_with_kanji/models/script_loader.dart';
import 'package:fun_with_kanji/pages/overview/kanji_list_tile.dart';

class KanjiViewer extends StatelessWidget {
  final int level;
  const KanjiViewer({required this.level, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kanji Level $level'),
      ),
      body: FutureBuilder<List<Kanji>>(
        future: ScriptLoader.loadKanji(level),
        builder: (context, snapshot) {
          final kanji = snapshot.data;
          if (kanji == null) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return ListView.builder(
            itemCount: kanji.length,
            itemBuilder: (_, i) => KanjiListTile(kanji: kanji[i]),
          );
        },
      ),
    );
  }
}
