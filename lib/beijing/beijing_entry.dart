/// 北京模块入口 — 预加载视频后渲染页面
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'screens/home_screen.dart';
import 'utils/app_state.dart';

class BeijingEntry extends StatefulWidget {
  const BeijingEntry({super.key});

  @override
  State<BeijingEntry> createState() => _BeijingEntryState();
}

class _BeijingEntryState extends State<BeijingEntry> {
  static VideoPlayerController? _sharedController;

  @override
  void initState() {
    super.initState();
    if (_sharedController == null) {
      _sharedController = VideoPlayerController.asset('assets/videos/beijing.mp4')
        ..initialize().then((_) {
          _sharedController!.setLooping(true);
          _sharedController!.setVolume(0);
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppStateProvider(
      child: HomeScreen(controller: _sharedController),
    );
  }
}
