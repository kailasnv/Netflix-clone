import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/homepage/bloc_popular/popular_bloc.dart';
import 'package:netflix_app/application/homepage/bloc_trending/trending_bloc.dart';
import 'package:netflix_app/application/homepage/bloc_tv_popular/tv_popu_bloc.dart';
import 'package:netflix_app/application/homepage/bloc_tv_shows/top_tv_bloc.dart';
import 'package:netflix_app/application/new_and_hot_page/bloc_coming_soon/comingsoon_bloc.dart';
import 'package:netflix_app/application/new_and_hot_page/bloc_now_playing/nowplaying_bloc.dart';
import 'package:netflix_app/application/search_page/bloc_search/search_bloc.dart';
import 'package:netflix_app/presentation/main_app_page/screen_main_page.dart';

import 'application/downloads/bloc_downloads/download_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DownloadBloc()),
        BlocProvider(create: (context) => ComingsoonBloc()),
        BlocProvider(create: (context) => NowplayingBloc()),
        BlocProvider(create: (context) => TrendingBloc()),
        BlocProvider(create: (context) => PopularBloc()),
        BlocProvider(create: (context) => TopTvBloc()),
        BlocProvider(create: (context) => TvPopuBloc()),
        BlocProvider(create: (context) => SearchBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        home: MainAppPage(),
      ),
    );
  }
}
