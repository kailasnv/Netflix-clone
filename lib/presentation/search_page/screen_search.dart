import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/core/frontend/constants.dart';
import 'package:netflix_app/presentation/search_page/widgets/top_searches_page.dart';
import 'package:netflix_app/presentation/search_page/widgets/your_searches.dart';

import '../../application/search_page/bloc_search/search_bloc.dart';
import 'debouncer/debouncer.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final Debounce _debounce = Debounce(const Duration(milliseconds: 1000));

  @override
  Widget build(BuildContext context) {
    //calling idle event
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchBloc>().add(SearchIdleEvent());
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 55),
        child: _textfieldSection(context),
      ),
      //  body:  show top searchs  / show movies and shows
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
          if (state.afterSearchedList == null) {
            return const TopSearchesPage();
          }

          if (state.afterSearchedList != null) {
            return const YourSearchesPage();
          } else {
            return const Center(child: Text("Fetching ..."));
          }
        },
      ),
    );
  }

// text feild section
//( and it is called in scaffold's appbar: parameter)s
  Padding _textfieldSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: CupertinoSearchTextField(
        onChanged: (value) {
          _debounce(
            () {
              print("typing >>>> $value");
              // calling search event & same time passing the text enterd by user - for searching..
              BlocProvider.of<SearchBloc>(context)
                  .add(SearchEnteredByUserEvent(value));
            },
          );
        },
        itemColor: Colors.grey,
        style: const TextStyle(color: Colors.white),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}
