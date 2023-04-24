import 'package:flutter/material.dart';
import 'package:flutter_douyin/ui/widgets/keep_alive.dart';
import 'package:flutter_douyin/ui/widgets/player_page.dart';
import 'package:flutter_douyin/viewmodel/app_provider.dart';
import 'package:flutter_douyin/viewmodel/home_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// @Name:           HomePage
/// @Description:    首页
/// @Author:         xiaofeng07
/// @CreateDate:     2023/4/4 16:45
/// @UpdateUser:     xiaofeng07
/// @UpdateDate:     2023/4/4 16:45
/// @UpdateRemark:
/// @Version:        1.0
class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ["探索", "同城", "关注", "商城", "推荐"];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: 4, length: tabs.length, vsync: this);
      Future.microtask(() {
    ref.read(homeViewState.notifier).dispatch(HomeViewAction.onStart);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewState= ref.watch(homeViewState);
    final viewModel = ref.read(homeViewState.notifier);
    return SafeArea(
      child: Stack(
        children: [
          TabBarView(
            //构建
            controller: _tabController,
            children: tabs.map((e) {
              return KeepAliveWrapper(
                child:PageView.builder(itemCount: viewState.dataList==null? 0: viewState.dataList?.length,itemBuilder: (context,index){
                    return VideoScreen(
                      videoInfo: viewState.dataList![index],
                    );
                })
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
