import 'package:flutter/foundation.dart';
import 'package:flutter_douyin/common/global.dart';
import 'package:flutter_douyin/data/model/video_info.dart';
import 'package:flutter_douyin/data/repo/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeVM extends StateNotifier<HomeViewState> {
  HomeVM(HomeViewState viewStates) : super(viewStates);
  HomeRepository _repository = HomeRepository();
  void dispatch(HomeViewAction action) {
    logger.d("dispatch");
    switch (action) {
      case HomeViewAction.onStart:
        getVideoList();
        break;
      case HomeViewAction.onRefresh:
        logger.d("onRefresh:${action}");
        onRefresh();
        break;
    }
  }

  void getVideoList() {
    _repository.getVideoList().then((value) =>{
      state=state.copyWith(dataList: value)
    });
  }

  void onRefresh(){
    logger.d("onRefresh");
  }
}

enum  HomeViewAction {
  //页面加载
  onStart,
  //刷新
  onRefresh
}

@immutable
class HomeViewState {
  final List<VideoInfo>? dataList;
  const HomeViewState({
     this.dataList,

  });

  HomeViewState copyWith({
    List<VideoInfo>? dataList,
  }) {
    return HomeViewState(dataList: dataList ?? this.dataList);
  }
}