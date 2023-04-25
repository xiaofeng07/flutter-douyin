import 'package:flutter/material.dart';
import 'package:flutter_douyin/common/global.dart';
import 'package:flutter_douyin/data/model/video_info.dart';
import 'package:flutter_douyin/data/repo/friends_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendsVM extends StateNotifier<FriendsViewState> {
  FriendsVM(FriendsViewState viewStates) : super(viewStates);
  final FriendsRepository _repository = FriendsRepository();
  void dispatch(FriendsViewAction action) {
    logger.d("dispatch");
    switch (action) {
      case FriendsViewAction.onStart:
        getFriendsVideoList([2,3]);
        break;
      case FriendsViewAction.onRefresh:
        logger.d("onRefresh:${action}");
        onRefresh();
        break;
    }
  }

  void getFriendsVideoList(List<int> friendIds) async {
    List<VideoInfo> dataList = await _repository.getFriendsVideoList(friendIds);
    logger.d("getFriendsVideoList===>${dataList}");
    state=state.copyWith(dataList: dataList);
  }

  void onRefresh(){
    logger.d("onRefresh");
  }
}

enum  FriendsViewAction {
  //页面加载
  onStart,
  //刷新
  onRefresh
}

@immutable
class FriendsViewState {
  final List<VideoInfo>? dataList;
  const FriendsViewState({
    this.dataList,

  });

  FriendsViewState copyWith({
    List<VideoInfo>? dataList,
  }) {
    return FriendsViewState(dataList: dataList ?? this.dataList);
  }
}