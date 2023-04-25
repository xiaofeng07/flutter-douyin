import 'package:flutter/material.dart';
import 'package:flutter_douyin/ui/widgets/keep_alive.dart';
import 'package:flutter_douyin/ui/widgets/player_page.dart';
import 'package:flutter_douyin/viewmodel/app_provider.dart';
import 'package:flutter_douyin/viewmodel/friends_vm.dart';
import 'package:flutter_douyin/viewmodel/home_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendPage extends ConsumerStatefulWidget {
  const FriendPage({Key? key}) : super(key: key);

  @override
  ConsumerState<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends ConsumerState<FriendPage> {
  @override
  void initState() {
    super.initState();
 /*   WidgetsBinding.instance.addPostFrameCallback((_) {
      //widget生命周期不允许修改provider
      //- build
      //- initState
      //- dispose
      //- didUpdateWidget
      //- didChangeDepedencies
      ref.read(homeViewState.notifier).dispatch(HomeViewAction.OnStart);
    });*/
    Future.microtask(() {
      ref.read(friendsViewState.notifier).dispatch(FriendsViewAction.onStart);
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewState= ref.watch(friendsViewState);
    final viewModel = ref.read(friendsViewState.notifier);
    return viewState.dataList==null||viewState.dataList!.isEmpty?const Center(child: Text("暂无新作品",style: TextStyle(fontSize: 18),),):KeepAliveWrapper(
        child:PageView.builder(scrollDirection:Axis.vertical,itemCount: viewState.dataList==null? 0: viewState.dataList?.length,itemBuilder: (context,index){
          return VideoScreen(
            videoInfo: viewState.dataList![index],
          );
        })
    );
  }


}
