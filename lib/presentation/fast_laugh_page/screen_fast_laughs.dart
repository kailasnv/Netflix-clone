import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/fast_laugh_page/video_url.dart';
import 'package:netflix_app/presentation/fast_laugh_page/widgets/video_tile_widget.dart';

class ScreenFastAndLaughs extends StatelessWidget {
  const ScreenFastAndLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // page view for reels
      body: PageView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          //NOTE :  No video API is Available  , so some dummy videoUrl links are used here
          final videoUrl = videoUrlFastLaugh[index % videoUrlFastLaugh.length];

          return VideoTileWidget(videoUrl: videoUrl);
        },
      ),
    );
  }
}
