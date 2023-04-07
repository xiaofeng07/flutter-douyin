import 'dart:async';
import 'package:flutter/material.dart';
import 'package:study/navigator/list_page.dart';
import 'package:study/navigator/second_page.dart';

/// @Name:           router.dart
/// @Description:    路由练习
/// @Author:         xiaofeng07
/// @CreateDate:     2023/4/3 18:12
/// @UpdateUser:     xiaofeng07
/// @UpdateDate:     2023/4/3 18:12
/// @UpdateRemark:
/// @Version:        1.0

class AppRouter extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
  final List<Page> _pages = [];
  late Completer<Object?> _boolResultCompleter;

  static const String listPage = '/list';
  static const String secondPage = '/second';

  static const String key = 'key';
  static const String value = 'value';

  AppRouter() {
    _pages.add(_createPage(const RouteSettings(name: listPage, arguments: [])));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: _onPopPage,
    );
  }

  @override
  Future<bool> popRoute({Object? params}) {
    if (params != null) {
      _boolResultCompleter.complete(params);
    }
    if (_canPop()) {
      _pages.removeLast();
      notifyListeners();
      return Future.value(true);
    }
    return _confirmExit();
  }

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {}

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;

    if (_canPop()) {
      _pages.removeLast();
      return true;
    } else {
      return false;
    }
  }

  bool _canPop() {
    return _pages.length > 1;
  }

  void replace({required String name, dynamic arguments}) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }

    push(name: name, arguments: arguments);
  }

  Future<Object?> push({required String name, dynamic arguments}) async {
    _boolResultCompleter = Completer<Object?>();
    if(_pages.last.name!=name){
      _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
    }
    print('$_pages');
    notifyListeners();
    return _boolResultCompleter.future;
  }

  MaterialPage _createPage(RouteSettings routeSettings) {
    Widget page;
    switch (routeSettings.name) {
      case listPage:
        page = const ListPage();
        break;
      case secondPage:
        page = SecondPage(params: routeSettings.arguments);
        break;
      default:
        page = const Scaffold();
    }
    print('_createPage:$page');
    return MaterialPage(
        child: page,
        key: Key(routeSettings.name!) as LocalKey,
        name: routeSettings.name,
        arguments: routeSettings.arguments);
  }

  Future<bool> _confirmExit() async {
    final result = await showDialog<bool>(
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('确认退出吗?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('取消')),
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('确定'))
            ],
          );
        });
    return result ?? true;
  }
}
