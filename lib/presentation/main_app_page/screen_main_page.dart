import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/download%20_page/screen_download.dart';
import 'package:netflix_app/presentation/fast_laugh_page/screen_fast_laughs.dart';
import 'package:netflix_app/presentation/home_page/screen_home.dart';
import 'package:netflix_app/presentation/main_app_page/widgets/bottom_nav_bar.dart';
import 'package:netflix_app/presentation/new&hot_page/screen_new_hot.dart';
import 'package:netflix_app/presentation/search_page/screen_search.dart';

class MainAppPage extends StatelessWidget {
  MainAppPage({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastAndLaughs(),
    ScreenSearch(),
    ScreenDownload(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: navBarIndexNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
