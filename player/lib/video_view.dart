import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:player/player.dart';

/// @Name:           video_view.dart
/// @Description:    视频播放组件封装
/// @Author:         xiaofeng07
/// @CreateDate:     2023/4/3 18:11
/// @UpdateUser:     xiaofeng07
/// @UpdateDate:     2023/4/3 18:11
/// @UpdateRemark:
/// @Version:        1.0

class VideoView extends StatefulWidget {
  final Player player;

  const VideoView({Key? key, required this.player}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: onTapVideo,
      child: Stack(
        children: [
          //AbsorbPointer拦截事件
          AbsorbPointer(
              absorbing: true, child: FijkView(player: widget.player,fit: FijkFit.cover,)),
          if (widget.player.state == FijkState.paused&&widget.player.state!=FijkState.completed)
            Align(
              alignment: Alignment.center,
              //插件和package开发要加包名访问assets
              child: Opacity(
                //透明度
                opacity: 0.5,
                child: Image.asset(
                  'assets/images/play.png',
                  package: 'player',
                  width: 90,
                  height: 120,
                ),
              ),
            )
        ],
      ),
    ));
  }

  void onTapVideo() {
    if (widget.player.state == FijkState.paused) {
      widget.player.start();
    } else {
      widget.player.pause();
    }
    setState(() {});
  }
}
