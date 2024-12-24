import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manto_bride/core/utils/app_logger.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String path;

  const VideoPlayerWidget({super.key, required this.path});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();

    flickManager = FlickManager(
        videoPlayerController:
            VideoPlayerController.networkUrl(Uri.parse(widget.path))
              ..initialize());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  void deactivate() {
    super.deactivate();
    flickManager.flickControlManager!.exitFullscreen();

    flickManager.dispose();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  void dispose() {
    // flickManager.flickControlManager!.exitFullscreen();

    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logger.i(widget.path);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return Theme(
      data: ThemeData(
          // primaryColor: AppColors.primaryColor,
          progressIndicatorTheme:
              ProgressIndicatorThemeData(color: AppColors.buttonColors)),
      child: FlickVideoPlayer(
        preferredDeviceOrientation: [
          DeviceOrientation.portraitUp,
          DeviceOrientation.landscapeLeft
        ],
        systemUIOverlay: [],
        flickVideoWithControls: FlickVideoWithControls(
          videoFit: BoxFit.scaleDown,
          controls: FlickPortraitControls(
            progressBarSettings:
                FlickProgressBarSettings(playedColor: AppColors.primaryColor),
          ),
        ),
        flickManager: flickManager,
      ),
    );
  }
}
