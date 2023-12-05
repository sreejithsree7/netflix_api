// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflixapi/core/colors/colors.dart';
import 'package:netflixapi/presentation/downloads/screen_downloads.dart';
import 'package:netflixapi/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflixapi/presentation/home/screen_home.dart';
import 'package:netflixapi/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflixapi/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflixapi/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
