import 'package:flutter/material.dart';
import 'package:flutter_douyin/common/global.dart';
import 'package:flutter_douyin/ui/page/splash_page.dart';
import '../ui/page/login_page.dart';
import '../ui/page/main_page.dart';
import '../ui/page/not_page.dart';


/// @Name:           RouterTable
/// @Description:    命名路由表
/// @Author:         "xiaofeng07"
/// @CreateDate:     2023/4/17 11:35
/// @UpdateUser:     "xiaofeng07"
/// @UpdateDate:     2023/4/17 11:35
/// @UpdateRemark:
/// @Version:        1.0

class RouterTable {
  static const String splashPath = "/splash";
  static const String mainPath = "/";
  static const String loginPath = "/login";
  static String notFoundPath = '404';
  static Map<String, WidgetBuilder> routeTables = {
    //404页面
    notFoundPath: (context) => const NotFoundPage(),
    //启动页
    splashPath: (context) => const SplashPage(),
    //登录
    loginPath: (context) => const LoginPage(),
    //首页
    mainPath: (context) => const MainPage(),
  };

  ///路由拦截
  static Route onGenerateRoute<T extends Object>(RouteSettings settings) {
    logger.d("onGenerateRoute=====>${settings.name}");
    return MaterialPageRoute<T>(
      settings: settings,
      builder: (context) {
        String? name = settings.name;
        if (routeTables[name] == null) {
          name = notFoundPath;
        }

        Widget widget = routeTables[name]!(context);

        return widget;
      },
    );
  }
}