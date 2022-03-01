import 'package:flutter/material.dart';
import 'package:funny_kanji/models/kanji.dart';
import 'package:funny_kanji/models/script_loader.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class KanjiViewer extends StatelessWidget {
  final int level;
  const KanjiViewer({required this.level, Key? key}) : super(key: key);

  void showInfo(Kanji kanji, BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
              child: CircleAvatar(
                  radius: 50,
                  child: Text(
                    kanji.kanji,
                    style: const TextStyle(fontSize: 60),
                  ))),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text(L10n.of(context)!.meanings),
                  subtitle: Text(kanji.meanings.join(', ')),
                ),
                ListTile(
                  title: Text(L10n.of(context)!.onReadings),
                  subtitle: Text(kanji.readingsOn.join(', ')),
                ),
                ListTile(
                  title: Text(L10n.of(context)!.kunReadings),
                  subtitle: Text(kanji.readingsKun.join(', ')),
                ),
                ListTile(
                  title: Text('${L10n.of(context)!.radicals}:'),
                  subtitle: Text(kanji.radicals.join(', ')),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('Close'),
            ),
          ],
        ),
      );

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
            itemBuilder: (_, i) => ListTile(
              leading: CircleAvatar(
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(kanji[i].kanji),
                  ),
                ),
                foregroundColor: Theme.of(context).textTheme.bodyText1?.color,
                backgroundColor: Theme.of(context).secondaryHeaderColor,
              ),
              title: Text(kanji[i].meanings.join(', ')),
              subtitle: Text(L10n.of(context)!.moreInfo),
              trailing: const Icon(YaruIcons.go_next),
              onTap: () => showInfo(kanji[i], context),
            ),
          );
        },
      ),
    );
  }
}
