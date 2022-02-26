import 'package:flutter/material.dart';
import 'package:funny_kanji/models/kana.dart';
import 'package:funny_kanji/models/script_loader.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class KatakanaViewer extends StatelessWidget {
  const KatakanaViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context)!.katakana),
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
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(katakana[i].kana),
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
