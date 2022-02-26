import 'package:flutter/material.dart';
import 'package:funny_kanji/models/kana.dart';
import 'package:funny_kanji/models/script_loader.dart';

class KatakanaViewer extends StatelessWidget {
  const KatakanaViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katakana'),
      ),
      body: FutureBuilder<List<Kana>>(
        future: ScriptLoader.loadKatakana(),
        builder: (context, snapshot) {
          final katakana = snapshot.data;
          if (katakana == null) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return ListView.builder(
            itemCount: katakana.length,
            itemBuilder: (context, i) => ListTile(
              leading: CircleAvatar(
                child: Center(
                  child: Text(
                    katakana[i].kana,
                    style: TextStyle(
                        fontSize: katakana[i].kana.length == 1 ? 26 : 18),
                  ),
                ),
                foregroundColor: Theme.of(context).textTheme.bodyText1?.color,
                backgroundColor: Theme.of(context).secondaryHeaderColor,
              ),
              title: Text(katakana[i].roumaji),
              subtitle: Text(katakana[i].type),
            ),
          );
        },
      ),
    );
  }
}
