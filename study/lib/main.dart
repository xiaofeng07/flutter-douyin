import 'package:flutter/material.dart';
import 'package:study/navigator/router.dart';

void main() => runApp(const MyApp());

AppRouter router = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter学习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Router(
         routerDelegate: router,
        backButtonDispatcher: RootBackButtonDispatcher()),
    );
  }
}
