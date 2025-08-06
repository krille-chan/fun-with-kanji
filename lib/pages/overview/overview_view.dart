import 'package:flutter/material.dart';

import 'package:fun_with_kanji/generated/l10n.dart';

import 'package:fun_with_kanji/models/kanji.dart';
import 'package:fun_with_kanji/pages/overview/kanji_list_tile.dart';
import 'package:fun_with_kanji/pages/overview/overview.dart';
import 'package:fun_with_kanji/pages/overview/overview_list_tile.dart';
import 'package:fun_with_kanji/utils/writing_system.dart';

class OverviewPageView extends StatelessWidget {
  final OverviewController controller;
  const OverviewPageView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchResult = controller.searchResult;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 12,
        title: TextField(
          onChanged: controller.search,
          controller: controller.searchController,
          decoration: InputDecoration(
            filled: true,
            hintText: L10n.of(context)!.search,
            prefixIcon: controller.searchLoading
                ? const CircularProgressIndicator.adaptive()
                : const Icon(Icons.search_outlined),
          ),
        ),
      ),
      body: searchResult != null
          ? ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, i) => searchResult[i] is Kanji
                  ? KanjiListTile(
                      kanji: searchResult[i] as Kanji,
                      subtitle: L10n.of(context)!.kanji,
                      moreIcon: Icons.info_outlined,
                    )
                  : ListTile(
                      leading: CircleAvatar(
                        foregroundColor:
                            Theme.of(context).textTheme.bodyLarge?.color,
                        backgroundColor: Theme.of(context).secondaryHeaderColor,
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(searchResult[i].toString()),
                          ),
                        ),
                      ),
                      title: Text(searchResult[i].description),
                      subtitle: Text(searchResult[i].runtimeType.toString()),
                    ),
            )
          : ListView(
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
