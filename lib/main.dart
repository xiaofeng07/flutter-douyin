import 'package:flutter/material.dart';
import 'package:flutter_douyin/router/app_router.dart';
import 'package:flutter_douyin/router/router_table.dart';
import 'package:flutter_douyin/ui/page/main_page.dart';
import 'package:flutter_douyin/ui/theme/theme.dart';
import 'package:flutter_douyin/utils/dialog_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  //为了使Provider发挥作用，您必须在Flutter应用程序的根部添加ProviderScope。
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRouter.navigatorKey,
      //navigatorObservers: [AppRouteObserver()],
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: const MainPage(),
      onGenerateRoute: RouterTable.onGenerateRoute,
      initialRoute: RouterTable.splashPath,
      builder: LoadingUtils.init(),
    );
  }
}
