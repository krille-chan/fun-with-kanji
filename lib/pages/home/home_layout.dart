import 'package:flutter/material.dart';
import 'package:fun_with_kanji/pages/home/home.dart';
import 'package:fun_with_kanji/pages/info/info.dart';
import 'package:fun_with_kanji/pages/overview/overview.dart';
import 'package:fun_with_kanji/pages/settings/settings.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  HomeLayoutState createState() => HomeLayoutState();
}

class HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        switch (currentIndex) {
          case 0:
            return const HomePage();
          case 1:
            return const OverviewPage();
          case 2:
            return const InfoPage();
          case 3:
          default:
            return const SettingsPage();
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          currentIndex = i;
        }),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(YaruIcons.checkbox_button_checked),
            label: L10n.of(context)!.learn,
          ),
          BottomNavigationBarItem(
            icon: const Icon(YaruIcons.search),
            label: L10n.of(context)!.overview,
          ),
          BottomNavigationBarItem(
            icon: const Icon(YaruIcons.information),
            label: L10n.of(context)!.info,
          ),
          BottomNavigationBarItem(
            icon: const Icon(YaruIcons.settings),
            label: L10n.of(context)!.settings,
          ),
        ],
      ),
    );
  }
}
