import 'package:flutter/material.dart';
import 'package:glovevoice/src/constants/image_strings.dart';
import 'package:video_player/video_player.dart';


class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/videos/GVVideo.mp4',
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      })
      ..addListener(() {
        setState(() {
          isPlaying = _controller.value.isPlaying;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(_controller),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPlaying ? _controller.pause() : _controller.play();
                    });
                  },
                  child: Image.asset(
                    isPlaying ? icPause : icLearning,
                    height: 50,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
