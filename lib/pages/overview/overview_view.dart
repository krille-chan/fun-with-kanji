import 'package:flutter/material.dart';
import 'package:fun_with_kanji/pages/overview/overview.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:fun_with_kanji/pages/overview/overview_list_tile.dart';
import 'package:fun_with_kanji/utils/writing_system.dart';

class OverviewPageView extends StatelessWidget {
  final OverviewController controller;
  const OverviewPageView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context)!.overview),
      ),
      body: ListView(
        children: WritingSystem.values
            .map((writingSystem) => OverviewListTile(
                  onTap: () => controller.goToViewer(writingSystem),
                  writingSystem: writingSystem,
                  title: writingSystem.getTitle(context),
                ))
            .toList(),
      ),
    );
  }
}
