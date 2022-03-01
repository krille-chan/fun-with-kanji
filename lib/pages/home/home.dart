import 'package:flutter/material.dart';
import 'package:fun_with_kanji/pages/home/home_view.dart';
import 'package:fun_with_kanji/pages/learning/learning.dart';
import 'package:fun_with_kanji/utils/writing_system.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageController createState() => HomePageController();
}

class HomePageController extends State<HomePage> {
  void learnSystem(WritingSystem writingSystem) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => LearningPage(writingSystem: writingSystem),
        ),
      );

  @override
  Widget build(BuildContext context) => HomePageView(this);
}
