import 'package:flutter/material.dart';
import 'package:fun_with_kanji/models/kanji.dart';
import 'package:fun_with_kanji/pages/overview/kanji_list_tile.dart';
import 'package:fun_with_kanji/pages/overview/overview.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:fun_with_kanji/pages/overview/overview_list_tile.dart';
import 'package:fun_with_kanji/utils/writing_system.dart';
import 'package:yaru_icons/yaru_icons.dart';

class OverviewPageView extends StatelessWidget {
  final OverviewController controller;
  const OverviewPageView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchResult = controller.searchResult;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: controller.search,
          controller: controller.searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: L10n.of(context)!.search,
            suffixIcon: controller.searchLoading
                ? const CircularProgressIndicator.adaptive()
                : searchResult == null
                    ? const Icon(YaruIcons.search)
                    : IconButton(
                        icon: const Icon(YaruIcons.window_close),
                        onPressed: controller.cancelSearch,
                      ),
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
                      moreIcon: YaruIcons.information,
                    )
                  : ListTile(
                      leading: CircleAvatar(
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(searchResult[i].toString()),
                          ),
                        ),
                        foregroundColor:
                            Theme.of(context).textTheme.bodyText1?.color,
                        backgroundColor: Theme.of(context).secondaryHeaderColor,
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
