import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_app/core/frontend/constants.dart';

import '../../widgets common/custom_icon.dart';
import 'package:video_player/video_player.dart';

/// video player widget section
class VideoTileWidget extends StatefulWidget {
  final String videoUrl;
  const VideoTileWidget({super.key, required this.videoUrl});

  @override
  State<VideoTileWidget> createState() => _VideoTileWidgetState();
}

class _VideoTileWidgetState extends State<VideoTileWidget> {
  //
  // a controller for video player
  late VideoPlayerController _videoPlayerController;
  // initiallize the video controller
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  double opacityPlayPause = 0;
  // play & Pause Method
  void playPauseMethod() {
    if (_videoPlayerController.value.isPlaying) {
      setState(() {
        _videoPlayerController.pause();
        opacityPlayPause = 1;
      });
    } else {
      setState(() {
        _videoPlayerController.play();
        Timer(const Duration(milliseconds: 1000), () {
          setState(() {
            opacityPlayPause = 0;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: playPauseMethod,
      child: Stack(
        children: [
          // video playing section
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: _videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
          ),
          /* play pause section
             with icon feedback  */
          Align(
            alignment: const Alignment(0, 0),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 10),
              opacity: opacityPlayPause,
              child: Container(
                child: _videoPlayerController.value.isPlaying
                    ? const Icon(Icons.pause, size: 55)
                    : const Icon(Icons.play_arrow, size: 55),
              ),
            ),
          ),
          /*
              mute icon
           */
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.volume_off),
                ),
              ),
            ),
          ),
          /*
             user intraction buttons
          */
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // icon of users
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person),
                  ),
                  kHeight,
                  kHeight,
                  // list of icons for users
                  const CustomIconWithText(
                      icon: Icons.emoji_emotions, title: 'LOL'),
                  const CustomIconWithText(icon: Icons.add, title: 'My List'),
                  const CustomIconWithText(icon: Icons.share, title: 'Share'),
                  CustomIconWithText(
                    icon: _videoPlayerController.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    title: _videoPlayerController.value.isPlaying
                        ? "Pause"
                        : " Play",
                  ),
                ],
              ),
            ),
          ),
          /*
            
            */
        ],
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
