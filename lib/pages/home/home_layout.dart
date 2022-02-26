import 'package:flutter/material.dart';
import 'package:funny_kanji/pages/home/home.dart';
import 'package:funny_kanji/pages/info/info.dart';
import 'package:funny_kanji/pages/overview/overview.dart';
import 'package:funny_kanji/pages/settings/settings.dart';
import 'package:yaru_icons/yaru_icons.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(YaruIcons.checkbox_button_checked),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(YaruIcons.search),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(YaruIcons.information),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(YaruIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
