import 'package:flutter/material.dart';
import 'package:funny_kanji/pages/home/home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageController createState() => HomePageController();
}

class HomePageController extends State<HomePage> {
  @override
  Widget build(BuildContext context) => HomePageView(this);
}
