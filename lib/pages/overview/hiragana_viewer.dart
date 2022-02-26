import 'package:flutter/material.dart';
import 'package:funny_kanji/models/kana.dart';
import 'package:funny_kanji/models/script_loader.dart';

class HiraganaViewer extends StatelessWidget {
  const HiraganaViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hiragana'),
      ),
      body: FutureBuilder<List<Kana>>(
        future: ScriptLoader.loadHiragana(),
        builder: (context, snapshot) {
          final hiragana = snapshot.data;
          if (hiragana == null) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return ListView.builder(
            itemCount: hiragana.length,
            itemBuilder: (context, i) => ListTile(
              leading: CircleAvatar(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(hiragana[i].kana),
                ),
                foregroundColor: Theme.of(context).textTheme.bodyText1?.color,
                backgroundColor: Theme.of(context).secondaryHeaderColor,
              ),
              title: Text(hiragana[i].roumaji),
              subtitle: Text(hiragana[i].type),
            ),
          );
        },
      ),
    );
  }
}
