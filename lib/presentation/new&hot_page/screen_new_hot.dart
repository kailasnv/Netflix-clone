// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/application/new_and_hot_page/bloc_now_playing/nowplaying_bloc.dart';
import 'package:netflix_app/core/frontend/constants.dart';
import 'package:netflix_app/presentation/new&hot_page/widgets/coming_soon.dart';
import 'package:netflix_app/presentation/new&hot_page/widgets/everyone_watching.dart';
import 'package:netflix_app/presentation/widgets%20common/custom_appbar_widget.dart';

import '../../application/new_and_hot_page/bloc_coming_soon/comingsoon_bloc.dart';
import 'package:intl/message_format.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // appbar section with  2 tabs
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 105),
          child: CustomAppbarWidget(
            title: 'New & Hot',
            bottomWidget: TabBar(
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.bold),
              isScrollable: true,
              tabs: const [
                Tab(text: '🍟 Coming soon'),
                Tab(text: '👀 Everyone\'s watching'),
              ],
            ),
          ),
        ),

        /// appbar end here ^
        //Now body section -/ coming soon & everyones watching
        body: const TabBarView(
          children: [
            ComingSoonTabPage(),
            EveryOnesWatchingTabPage(),
          ],
        ),
      ),
    );
  }
}

///   TAB  1
class ComingSoonTabPage extends StatelessWidget {
  const ComingSoonTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    // calling coming soon event
    context.read<ComingsoonBloc>().add(FetchComingSoonMoviesEvent());

    return BlocBuilder<ComingsoonBloc, ComingsoonState>(
      builder: (context, state) {
        if (state.isLoading == true) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.comingSoonMoviesList != null) {
          return ListView.builder(
            itemCount: state.comingSoonMoviesList!.length,
            itemBuilder: (context, index) {
              // date formatting section
              String _month = '';
              String _day = '';
              try {
                final _date = DateTime.parse(
                  state.comingSoonMoviesList![index].releaseDate,
                );

                final formattedDate = DateFormat.yMMMMd('en-US').format(_date);
                _month = formattedDate
                    .split(' ')
                    .first
                    .substring(0, 3)
                    .toUpperCase();
                _day = _date.toString().split('-')[1];
              } catch (_) {
                _month = '';
                _day = '';
              }
              //
              return ComingSoonWidget(
                movieImagePath: state.comingSoonMoviesList![index].posterPath,
                movieName: state.comingSoonMoviesList![index].movieName,
                overview: state.comingSoonMoviesList![index].overview,
                releaseMonth: _month,
                releaseDay: _day,
              );
            },
          );
        } else {
          return kWidth;
        }
      },
    );
  }
}

//   TAB 2
class EveryOnesWatchingTabPage extends StatelessWidget {
  const EveryOnesWatchingTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    //calling event
    context.read<NowplayingBloc>().add(FetchNowPlayingMoviesEvent());

    return BlocBuilder<NowplayingBloc, NowplayingState>(
      builder: (context, state) {
        if (state.isLoading == true) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.nowPlayingMoviesList != null) {
          return ListView.builder(
            itemCount: state.nowPlayingMoviesList!.length,
            itemBuilder: (context, index) {
              return EveryonesWatchingWidget(
                imagePath: state.nowPlayingMoviesList![index].posterPath,
                movieName: state.nowPlayingMoviesList![index].movieName,
                overview: state.nowPlayingMoviesList![index].overview,
                releaseDate: state.nowPlayingMoviesList![index].releaseDate,
              );
            },
          );
        } else {
          return kWidth;
        }
      },
    );
  }
}
