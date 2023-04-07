import 'package:flutter/foundation.dart';
import 'package:flutter_douyin/common/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeVM extends StateNotifier<HomeViewState> {
  HomeVM(HomeViewState viewStates) : super(viewStates);

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
    state=state.copyWith(testData: "getVideoList");
  }

  void onRefresh(){
    logger.d("onRefresh");
    state=state.copyWith(testData: "onRefresh");
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
  final String? testData;
  const HomeViewState({
     this.testData,

  });

  HomeViewState copyWith({
    String? testData,
  }) {
    return HomeViewState(testData: testData ?? this.testData);
  }
}