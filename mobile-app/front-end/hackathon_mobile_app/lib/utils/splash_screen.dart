import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  final Widget navigateToPage;

  const SplashScreen({
    super.key,
    required this.navigateToPage,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    _videoController =
        VideoPlayerController.asset("assets/videos/splash_screen_vid_new.mp4");

    _videoController.initialize().then(
      (value) {
        _videoController.play();
        setState(() {});
      },
    );

    _videoController.setLooping(false);

    _videoController.addListener(
      () async {
        if (_videoController.value.position ==
            _videoController.value.duration) {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  widget.navigateToPage,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final tween = Tween(
                  begin: Offset(1, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.linearToEaseOut),
                );

                final position = animation.drive(tween);

                return SlideTransition(
                  position: position,
                  child: child,
                );
              },
              transitionDuration: Duration(milliseconds: 300),
            ),
          );

          _videoController.dispose();
        }
      },
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _videoController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              )
            : Container(),
      ),
    );
  }
}
