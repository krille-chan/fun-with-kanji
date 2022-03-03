import 'package:flutter/material.dart';
import 'package:fun_with_kanji/models/fun_with_kanji.dart';
import 'package:fun_with_kanji/pages/home/home.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:fun_with_kanji/pages/home/learn_unit_list_tile.dart';
import 'package:fun_with_kanji/utils/writing_system.dart';

class HomePageView extends StatelessWidget {
  final HomePageController controller;
  const HomePageView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.of(context)!.learn)),
      body: StreamBuilder<void>(
          stream: FunWithKanji.of(context).onChanges,
          builder: (context, snapshot) => ListView(
                padding: const EdgeInsets.all(32),
                children: WritingSystem.values
                    .map((writingSystem) => FutureBuilder<int>(
                          future: FunWithKanji.of(context).loadProgressPercent(
                            writingSystem,
                          ),
                          builder: (context, snapshot) => AnimatedScale(
                            scale: snapshot.connectionState ==
                                    ConnectionState.waiting
                                ? 0
                                : 1,
                            curve: Curves.easeInOut,
                            duration: Duration(
                                milliseconds:
                                    300 + (100 * writingSystem.index)),
                            child: LeanUnitListTile(
                              progress: snapshot.data,
                              title: writingSystem.getTitle(context),
                              symbol: writingSystem.symbol,
                              onTap: () =>
                                  controller.learnSystem(writingSystem),
                            ),
                          ),
                        ))
                    .toList(),
              )),
    );
  }
}
