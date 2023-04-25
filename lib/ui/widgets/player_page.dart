import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douyin/common/app_icon.dart';
import 'package:flutter_douyin/common/global.dart';
import 'package:flutter_douyin/data/model/video_info.dart';
import 'package:flutter_douyin/ui/animation/favorite_heart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:player/player.dart';
import 'package:player/video_view.dart';
import 'package:flutter_douyin/ext/int_ext.dart';

/// @Name:           player_page.dart
/// @Description:    视频播放页
/// @Author:         xiaofeng07
/// @CreateDate:     2023/4/3 18:11
/// @UpdateUser:     xiaofeng07
/// @UpdateDate:     2023/4/3 18:11
/// @UpdateRemark:
/// @Version:        1.0

class VideoScreen extends StatefulWidget {
  final VideoInfo videoInfo;

  VideoScreen({Key? key, required this.videoInfo});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final Player player = Player();

  _VideoScreenState();

  @override
  void initState() {
    super.initState();
    player.setDataSource(widget.videoInfo.playUrl!, autoPlay: true);
  }

  @override
  Widget build(BuildContext context) {
    final videoInfo = widget.videoInfo;
    return Scaffold(
        body: Stack(
      children: [
        FavoriteHeart(
            child: VideoView(
          player: player,
        ),callBack: (){
          videoInfo.isFavorite=true;
        },),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10), //分开设置四边距离
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //跳转到个人主页
                          logger.d('跳转到个人主页');
                        },
                        child: ClipOval(
                            child: Image.network(
                              '${videoInfo.picUser}',
                          width: 60,
                          height: 60,
                          fit: BoxFit.fill,
                        )),
                      ),
                      Positioned(
                          bottom: -20,
                          child: IconButton(
                              onPressed: () {
                                //关注该用户
                                logger.d('关注该用户');
                              },
                              icon: const Icon(
                                AppIcons.addCircle,
                                color: Colors.red,
                                size: 20,
                              )))
                    ],
                  ),
                  const SizedBox(height: 15),
                   GestureDetector(onTap: (){
                     videoInfo.isFavorite=!videoInfo.isFavorite!;
                      setState(() {

                      });
                   },child: Icon(
                     AppIcons.favorite,
                     color: videoInfo.isFavorite!?Colors.pinkAccent:Colors.white,
                     size: 40,
                   ),),
                  Text("${videoInfo.favoriteNum?.format()}"),
                  const SizedBox(height: 15),
                  const Icon(
                    AppIcons.comment,
                    color: Colors.white,
                    size: 40,
                  ),
                  Text("${videoInfo.commentNum?.format()}"),
                  const SizedBox(height: 15),
                  GestureDetector(onTap: (){
                    videoInfo.isCollected=!videoInfo.isCollected!;
                    setState(() {

                    });
                  },child:  Icon(
                    AppIcons.collect,
                    color: videoInfo.isCollected==true ?Colors.orangeAccent:Colors.white,
                    size: 40,
                  ),),
                  Text("${videoInfo.collectNum?.format()}"),
                  const SizedBox(height: 15),
                  IconButton(
                      onPressed: () {
                        showShareDialog(context);
                      },
                      icon: const Icon(
                        AppIcons.share,
                        color: Colors.white,
                        size: 40,
                      )),
                  const SizedBox(height: 30),
                  ClipOval(
                      child: Image.network(
                    '${videoInfo.picUser}',
                    width: 60,
                    height: 60,
                    fit: BoxFit.fill,
                  )),
                  const SizedBox(height: 5),
                ],
              ),
            ))
      ],
    ));
  }

  void showShareDialog(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '分享给朋友',
                        style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.black),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close_rounded,color: Colors.black))
                  ],
                ),
                SizedBox(
                    height: 200,
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, //横轴4个子widget
                              childAspectRatio: 1.0 //宽高比为1时，子widget
                              ),
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipOval(
                                child: Image.network(
                              'https://pic.netbian.com/uploads/allimg/170424/105210-1493002330557b.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill,
                            )),
                            Text('用户昵称',style: TextStyle( color: Colors.black))
                          ],
                        ),
                      ],
                    )),
                const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: const Icon(
                              AppIcons.copyLink,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          const Center(
                            child: Text("复制链接",style: TextStyle( color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                //保存本地
                                _saveLocal(widget.videoInfo.playUrl!);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: const Icon(
                                  AppIcons.saveLocal,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              )),
                          const Center(
                            child: Text("保存本地",style: TextStyle( color: Colors.black)),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  /// 下载视频
  Future<void> _saveLocal(String url) async {
    final dio = Dio();
    final filePath =
        '${(await getTemporaryDirectory()).path}/${DateTime.now().millisecondsSinceEpoch}.mp4';

    var response = await dio.download(
      url,
      filePath,
    );
    logger.d(filePath);
    logger.d('${response.statusCode}');
  }
}
