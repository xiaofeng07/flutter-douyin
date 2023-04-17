
import 'package:flutter/material.dart';

/// @Name:           AppRouter
/// @Description:    路由封装
/// @Author:         "xiaofeng07"
/// @CreateDate:     2023/4/17 11:31
/// @UpdateUser:     "xiaofeng07"
/// @UpdateDate:     2023/4/17 11:31
/// @UpdateRemark:
/// @Version:        1.0

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void push(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static Future<Object?> pushNamed(BuildContext context, String routeName,
      {Object? arguments})async {
   return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static void pushReplacement(BuildContext context, Widget page, {Object? arguments}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static void pushNamedAndRemoveUntil(
      BuildContext context, String routeName, RoutePredicate predicate) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, predicate);
  }

  static void pop(BuildContext context, {Object? arguments}) {
    Navigator.of(context).pop(arguments);
  }
}
