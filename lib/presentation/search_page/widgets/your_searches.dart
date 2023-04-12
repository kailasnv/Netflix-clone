import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/core/backend/constants.dart';
import 'package:netflix_app/core/frontend/constants.dart';
import 'package:netflix_app/presentation/widgets%20common/title_for_playlist.dart';

import '../../../application/search_page/bloc_search/search_bloc.dart';

class YourSearchesPage extends StatelessWidget {
  const YourSearchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleForPlaylist(title: 'Movies and Shows'),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.afterSearchedList != null) {
                return GridView.builder(
                  itemCount: state.afterSearchedList!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3.3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Colors.grey.shade900,
                        // movie image
                        child: Image.network(
                          "$urlImageFirstPart${state.afterSearchedList![index].posterPath}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              } else {
                return kWidth;
              }
            },
          ),
        )
      ],
    );
  }
}
