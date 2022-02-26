import 'package:flutter/material.dart';
import 'package:funny_kanji/pages/home/home.dart';

class HomePageView extends StatelessWidget {
  final HomePageController controller;
  const HomePageView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Hallo Welt')),
    );
  }
}
