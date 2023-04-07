import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_douyin/common/global.dart';

/// @Name:           FavoriteHeart
/// @Description:
/// @Author:         xiaofeng07
/// @CreateDate:     2023/4/3 22:40
/// @UpdateUser:     xiaofeng07
/// @UpdateDate:     2023/4/3 22:40
/// @UpdateRemark:
/// @Version:        1.0
class FavoriteHeart extends StatefulWidget {
  final Widget child;
  final double size;

  const FavoriteHeart({Key? key, required this.child, this.size = 100.0})
      : super(key: key);

  @override
  State<FavoriteHeart> createState() => _FavoriteHeartState();
}

class _FavoriteHeartState extends State<FavoriteHeart> {
  final GlobalKey _key = GlobalKey();
  Offset downOffset = Offset.zero;

  //保存连续点击未消失的红心坐标
  List<Offset> downOffsets = [];

  @override
  Widget build(BuildContext context) {
    var favoriteStack = Stack(
        children: downOffsets.map((e) => FavoriteAnimation(
            key: UniqueKey(),
            onAnimationComplete: () {
              downOffsets.remove(e);
            },
            position: e,
            child: Icon(Icons.favorite,
                size: widget.size,
                color: const Color(0xffF84B76))))
            .toList());
    return GestureDetector(
        key: _key,
        onDoubleTapDown: (details) {
          downOffset = _globalToLocal(details.globalPosition);
        },
        onDoubleTap: () {
          setState((){
            downOffsets.add(downOffset);
          });
        },
        child: Stack(
          children: [widget.child, favoriteStack],
        ));
  }

  Offset _globalToLocal(Offset globalPosition) {
    RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    return renderBox.globalToLocal(globalPosition);
  }
}

/// @Name:           FavoriteAnimation
/// @Description:    点赞动画效果
/// @Author:         xiaofeng07
/// @CreateDate:     2023/4/3 22:38
/// @UpdateUser:     xiaofeng07
/// @UpdateDate:     2023/4/3 22:38
/// @UpdateRemark:
/// @Version:        1.0

class FavoriteAnimation extends StatefulWidget {
  final Widget child;
  final double size;
  final int duration;
  final Offset position;
  final Function? onAnimationComplete;

  const FavoriteAnimation(
      { Key? key,
      required this.child,
      this.size = 100.0,
      this.duration = 500,
      this.onAnimationComplete,
      required this.position})
      : super(key: key);

  @override
  State<FavoriteAnimation> createState() => _FavoriteAnimationState();
}

class _FavoriteAnimationState extends State<FavoriteAnimation>
    with TickerProviderStateMixin {
  static const double appearValue = 0.1; //显示进度
  static const double dismissValue = 0.8; //消失进度
  late AnimationController _animationController;

  double angle = pi / 10 * (2 * Random().nextDouble() - 1);

  @override
  void initState() {
    super.initState();
    print('执行动画');
    _animationController = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);
    _animationController.addListener(() {
      setState(() {});
    });
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    var content = widget.child;

    var child = ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (Rect bounds) => RadialGradient(
            colors: const [Color(0xFFFA93AD), Color(0xFFF84B76)],
            center: Alignment.topLeft.add(const Alignment(0.66, 0.66)))
            .createShader(bounds),
        child: Transform.rotate(
            angle: angle,
            child: Transform.scale(
              scale: scale,
              alignment: Alignment.bottomCenter,
              child: content,
            )));

    return Positioned(
      left: widget.position.dx - widget.size / 2,
      top: widget.position.dy - widget.size / 2,
      child: Opacity(opacity: opacity, child: child));
  }

  double get opacity {
    if (value < appearValue) {
      //逐渐展示阶段
      return value / appearValue;
    }
    if (value < dismissValue) {
      return 1.0;
    }
    return (1 - value) / (1 - dismissValue);
  }

  double get scale {
    if (value < appearValue) {
      //逐渐展示阶段
      return 1 + appearValue - value;
    }
    if (value < dismissValue) {
      return 1.0;
    }
    return 1 + (value - dismissValue) / (1 - dismissValue);
  }

  double get value {
    //返回动画进度
    return _animationController.value;
  }

  Future<void> startAnimation() async {
    await _animationController.forward();
    widget.onAnimationComplete?.call();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
