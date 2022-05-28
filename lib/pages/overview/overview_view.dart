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
    const inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: SizedBox(
          width: double.infinity,
          height: 48,
          child: Center(
            child: TextField(
              onChanged: controller.search,
              controller: controller.searchController,
              decoration: InputDecoration(
                border: inputBorder,
                focusedBorder: inputBorder,
                enabledBorder: inputBorder,
                hintText: L10n.of(context)!.search,
                suffixIcon: controller.searchLoading
                    ? const CircularProgressIndicator.adaptive()
                    : searchResult == null
                        ? const Icon(YaruIcons.search, size: 26)
                        : IconButton(
                            icon: const Icon(YaruIcons.window_close, size: 26),
                            onPressed: controller.cancelSearch,
                          ),
              ),
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
                        foregroundColor:
                            Theme.of(context).textTheme.bodyText1?.color,
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
