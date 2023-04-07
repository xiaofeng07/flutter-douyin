import 'package:flutter/material.dart';
import 'package:flutter_douyin/ui/widgets/keep_alive.dart';
import 'package:flutter_douyin/ui/widgets/player_page.dart';

/// @Name:           HomePage
/// @Description:    首页
/// @Author:         xiaofeng07
/// @CreateDate:     2023/4/4 16:45
/// @UpdateUser:     xiaofeng07
/// @UpdateDate:     2023/4/4 16:45
/// @UpdateRemark:
/// @Version:        1.0
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ["探索", "同城", "关注", "商城", "推荐"];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: 4, length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          TabBarView(
            //构建
            controller: _tabController,
            children: tabs.map((e) {
              return KeepAliveWrapper(
                child: VideoScreen(
                  url:
                      'https://minivideo.xiu123.cn/original/5e4307cb9e434dc49ae7bebab27923ce/38d181c9-17b5f79409e.mp4',
                ),
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 10,),
              GestureDetector(
                child: const Icon(Icons.add_circle_outline_rounded),
                onTap: () {},
              ),
              TabBar(
                isScrollable: true,
                indicatorWeight:1.0,
                dividerColor: Colors.transparent,
                controller: _tabController,
                tabs: tabs.map((e) => Tab(text: e)).toList(),
              ),
              GestureDetector(
                  child: const Icon(Icons.search,size: 30,),
                  onTap: () {}),
              const SizedBox(width: 10,)
            ],

          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }
}
