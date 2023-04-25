import 'package:flutter_douyin/viewmodel/friends_vm.dart';
import 'package:flutter_douyin/viewmodel/home_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewState = StateNotifierProvider<HomeVM,HomeViewState>((ref) {
  return HomeVM(HomeViewState());
});


// final homeVM = FutureProvider<HomeVM>((ref) {
//   return HomeVM(HomeViewState());
// });


final friendsViewState = StateNotifierProvider<FriendsVM,FriendsViewState>((ref) {
  return FriendsVM(FriendsViewState());
});