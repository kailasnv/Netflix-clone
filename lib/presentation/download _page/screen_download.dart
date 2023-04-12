import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix_app/presentation/download%20_page/widgets/movie_poster_tile.dart';
import 'package:netflix_app/presentation/widgets%20common/custom_appbar_widget.dart';

import '../../application/downloads/bloc_downloads/download_bloc.dart';
import '../../core/backend/constants.dart';
import '../../core/frontend/constants.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});

  final _pageSections = [
    const SmartDownloadsSection(),
    const SomeIntroTextSection(),
    const ShowThreeMoviePosterSection(),
    const ButtonsSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppbarWidget(
          // Appbar section
          title: 'Downloads',
        ),
      ),
      body: ListView.builder(
        itemCount: _pageSections.length,
        itemBuilder: (context, index) {
          return _pageSections[index];
        },
      ),
    );
  }
}

//Section 1
class SmartDownloadsSection extends StatelessWidget {
  const SmartDownloadsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
      child: Row(
        children: [
          Icon(
            Icons.settings,
            color: Colors.grey[300],
          ),
          kWidth,
          Text(
            'smart download',
            style: TextStyle(
              fontWeight: FontWeight.w200,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}

// Section 2
class SomeIntroTextSection extends StatelessWidget {
  const SomeIntroTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Introducing Downloads For You',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        //
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            'We\'ll download a personalised selection of movies and shows for you . so there\'s always something to watch on your device',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

// Section 3
class ShowThreeMoviePosterSection extends StatelessWidget {
  const ShowThreeMoviePosterSection({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DownloadBloc>().add(FetchDownloadsPageMoviesEvent());
    });

    return SizedBox(
        // color: Colors.amber,
        width: double.infinity,
        height: 250,
        child: BlocBuilder<DownloadBloc, DownloadState>(
          builder: (context, state) {
            if (state.isLoading == true) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.movieDetails != null) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(radius: 130, backgroundColor: Colors.grey[800]),
                  //  photo widgets x3

                  MoviewPosterTile(
                    imagePath:
                        urlImageFirstPart + state.movieDetails![10].posterPath,
                    padding: const EdgeInsets.only(top: 56, left: 175),
                    angle: 13,
                  ),

                  MoviewPosterTile(
                    imagePath:
                        urlImageFirstPart + state.movieDetails![12].posterPath,
                    padding: const EdgeInsets.only(top: 56, right: 175),
                    angle: -13,
                  ),

                  MoviewPosterTile(
                    imagePath:
                        urlImageFirstPart + state.movieDetails![13].posterPath,
                    padding: const EdgeInsets.only(top: 20),
                    height: 200,
                    width: 135,
                  ),
                ],
              );
            } else {
              return kHeight;
            }
          },
        ));
  }
}

//Section 4
class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Column(
        children: [
          // set up button

          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45, top: 100),
            child: MaterialButton(
              color: Colors.blue[800],
              textColor: Colors.white,
              onPressed: () {},
              child: const Center(
                child: Text(
                  'Set Up',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // download
          Padding(
            padding: const EdgeInsets.only(left: 65, right: 65, top: 10),
            child: MaterialButton(
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () {},
              child: const Center(
                child: Text(
                  'See What You Can Download',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
