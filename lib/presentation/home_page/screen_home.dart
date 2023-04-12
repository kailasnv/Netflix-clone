import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/homepage/bloc_trending/trending_bloc.dart';
import 'package:netflix_app/core/backend/constants.dart';
import 'package:netflix_app/core/frontend/constants.dart';
import 'package:netflix_app/presentation/home_page/widgets/dead_widget.dart';
import 'package:netflix_app/presentation/home_page/widgets/movie_playlist_widget.dart';
import 'package:netflix_app/presentation/home_page/widgets/top_ten_movie_playlist_widget.dart';
import 'package:netflix_app/presentation/widgets%20common/custom_icon.dart';
import 'package:netflix_app/presentation/widgets%20common/gradient_box.dart';

import '../../application/homepage/bloc_popular/popular_bloc.dart';
import '../../application/homepage/bloc_tv_popular/tv_popu_bloc.dart';
import '../../application/homepage/bloc_tv_shows/top_tv_bloc.dart';
import '../widgets common/smile_box.dart';

//  valueNotifier -/ actuallly used for the animation of Appbar
ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    // calling the events
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrendingBloc>().add(FetchTrendingMoviesEvent());
      context.read<PopularBloc>().add(FetchPopularMoviesEvent());
      context.read<TopTvBloc>().add(FetchTopTvShowsEvent());
      context.read<TvPopuBloc>().add(FetchPopularTvShowsEvent());
    });

    return Scaffold(
      /*
      NotificationListener is used for getting scroll direction
       */
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }

              return true;
            },
            child: Stack(
              // this stack is used to bring a animated appbar above the listview.
              children: [
                ListView(
                  children: [
                    // Large Background image of any movie
                    Stack(
                      // this stack is used for giving a gradient effect above the image's top&bottom Section
                      children: [
                        // Main Large background image in apps homePage
                        SizedBox(
                          width: double.infinity,
                          height: 520,
                          child: BlocBuilder<TopTvBloc, TopTvState>(
                            builder: (context, state) {
                              if (state.isLoading == true) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.red,
                                  ),
                                );
                              }
                              if (state.topTvShowsList != null) {
                                return Image.network(
                                  "$urlImageFirstPart${state.topTvShowsList![11].posterPath}",
                                  fit: BoxFit.cover,
                                );
                              } else {
                                return kWidth;
                              }
                            },
                          ),
                        ),
                        // bottom Gradient
                        const Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: GradientBox(
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black,
                            ],
                          ),
                        ),
                        // Custom animated AppBar section
                      ],
                    ),
                    // some buttons( - my list , play , info ) below the background image
                    const HomeButtonBar(),
                    // list of movies playlists
                    // ****************************************************

                    // *popular movies
                    BlocBuilder<PopularBloc, PopularState>(
                      builder: (context, state) {
                        if (state.isLoading == true) {
                          return const DeadListviewWidget();
                        }
                        if (state.popularMoviesList != null) {
                          return MoviePlayListWidget(
                            playlistName: "Popular Movies",
                            imageListOfMovies: state.popularMoviesList!,
                          );
                        } else {
                          return kWidth;
                        }
                      },
                    ),
                    // *top 10 tv shows
                    BlocBuilder<TopTvBloc, TopTvState>(
                      builder: (context, state) {
                        if (state.isLoading == true) {
                          return const DeadListviewWidget();
                        }
                        if (state.topTvShowsList != null) {
                          return TopTenMoviePlayListWidget(
                            playlistName: "Top 10 Tv Shows Of Today",
                            topTvShowsList: state.topTvShowsList!,
                          );
                        } else {
                          return kWidth;
                        }
                      },
                    ),

                    // *trending
                    BlocBuilder<TrendingBloc, TrendingState>(
                      builder: (context, state) {
                        if (state.isLoading == true) {
                          return const DeadListviewWidget();
                        }
                        if (state.trendingMoiveList != null) {
                          return MoviePlayListWidget(
                            playlistName: "Trending Movies Now",
                            imageListOfMovies: state.trendingMoiveList!,
                          );
                        } else {
                          return kWidth;
                        }
                      },
                    ),
                    // *popular tv shows
                    BlocBuilder<TvPopuBloc, TvPopuState>(
                      builder: (context, state) {
                        if (state.isLoading == true) {
                          return const DeadListviewWidget();
                        }
                        if (state.popularTvShowsList != null) {
                          return MoviePlayListWidget(
                            playlistName: "Best TV Shows For You",
                            imageListOfMovies: state.popularTvShowsList!,
                          );
                        } else {
                          return kHeight;
                        }
                      },
                    ),

                    // ***************************************
                  ],
                ),
                /*
                   A P P - B A R
                */
                // Some animations for alignment and opacity for the homeAppbar widget
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.ease,
                  alignment: scrollNotifier.value
                      ? const Alignment(-1, -1)
                      : const Alignment(-2, -2),
                  child: AnimatedOpacity(
                    opacity: scrollNotifier.value ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1000),
                    child: _homeAppbar(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  GradientBox _homeAppbar() {
    return GradientBox(
      // basically a custom container with gradient effect
      colors: const [Colors.black, Colors.transparent],
      child: Column(
        // this column has 2 rows
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 10, top: 13),
            child: Row(
              // 1st Row - / netflix logo , cast icon , bluebox
              children: [
                Image.asset(
                  'lib/core/frontend/images/netflix.png',
                  width: 30,
                ),
                const Spacer(),
                const Icon(Icons.cast),
                kWidth,
                const SmileBlueBox(),
              ],
            ),
          ),
          kHeight,
          kHeight,
          // 2nd row -/ categories > > TV Shows , Movies , select Categories dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'TV Shows',
                style: myTextStyle1,
              ),
              const Text(
                'Movies',
                style: myTextStyle1,
              ),
              Row(
                children: const [
                  Text(
                    'Categories',
                    style: myTextStyle1,
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//  3 buttons in a row widget for Home page -/ myList ,play , info
class HomeButtonBar extends StatelessWidget {
  const HomeButtonBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CustomIconWithText(
          icon: Icons.add,
          title: 'My List',
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: MaterialButton(
            color: Colors.white,
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.play_arrow),
                Text('Play'),
              ],
            ),
          ),
        ),
        const CustomIconWithText(
          icon: Icons.info_outline,
          title: 'info',
        ),
      ],
    );
  }
}
