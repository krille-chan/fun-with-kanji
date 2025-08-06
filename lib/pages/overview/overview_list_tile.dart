import 'package:flutter/material.dart';

import 'package:fun_with_kanji/generated/l10n.dart';

import 'package:fun_with_kanji/utils/writing_system.dart';

class OverviewListTile extends StatelessWidget {
  final void Function() onTap;
  final WritingSystem writingSystem;
  final String title;

  const OverviewListTile({
    required this.title,
    required this.onTap,
    required this.writingSystem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(writingSystem.symbol)),
      title: Text(title),
      subtitle: Text(
          L10n.of(context)!.countEntries(writingSystem.entries.toString())),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_right_outlined),
    );
  }
}
