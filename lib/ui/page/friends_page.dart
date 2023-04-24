import 'package:flutter/material.dart';
import 'package:flutter_douyin/viewmodel/app_provider.dart';
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

  }

  @override
  Widget build(BuildContext context) {
    final viewState= ref.watch(homeViewState);
    final viewModel = ref.read(homeViewState.notifier);
    return Center(child:  Column(children: [
      Text("${viewState.dataList}"),
      TextButton(onPressed: (){
        viewModel.dispatch(HomeViewAction.onRefresh);
      }, child: Text("刷新"))
    ],),);
  }


}
