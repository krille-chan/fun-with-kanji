import 'package:flutter/material.dart';

import 'package:fun_with_kanji/generated/l10n.dart';

import 'package:fun_with_kanji/models/kanji.dart';

class KanjiListTile extends StatelessWidget {
  final Kanji kanji;
  final String? subtitle;
  final IconData? moreIcon;
  const KanjiListTile({
    required this.kanji,
    this.subtitle,
    this.moreIcon,
    Key? key,
  }) : super(key: key);

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
                  title: Text('${L10n.of(context)!.radicalsName}:'),
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
    return ListTile(
      leading: CircleAvatar(
        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        child: SizedBox(
          width: 32,
          height: 32,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(kanji.kanji),
          ),
        ),
      ),
      title: Text(kanji.meanings.join(', ')),
      subtitle: Text(subtitle ?? L10n.of(context)!.moreInfo),
      trailing: Icon(moreIcon ?? Icons.arrow_right_outlined),
      onTap: () => showInfo(kanji, context),
    );
  }
}
