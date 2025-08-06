import 'package:flutter/material.dart';
import 'package:fun_with_kanji/generated/l10n.dart';

import 'package:fun_with_kanji/pages/home/home.dart';
import 'package:fun_with_kanji/pages/info/info.dart';
import 'package:fun_with_kanji/pages/overview/overview.dart';
import 'package:fun_with_kanji/pages/settings/settings.dart';

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
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (i) => setState(() {
          currentIndex = i;
        }),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.check_circle_outlined),
            label: L10n.of(context)!.learn,
          ),
          NavigationDestination(
            icon: const Icon(Icons.search_outlined),
            label: L10n.of(context)!.overview,
          ),
          NavigationDestination(
            icon: const Icon(Icons.info_outline),
            label: L10n.of(context)!.info,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            label: L10n.of(context)!.settings,
          ),
        ],
      ),
    );
  }
}
