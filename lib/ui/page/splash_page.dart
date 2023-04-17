import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_douyin/router/app_router.dart';
import 'package:flutter_douyin/router/router_table.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      Timer(const Duration(milliseconds: 200), () {
       AppRouter.pushNamedAndRemoveUntil(context,RouterTable.mainPath, (Route<dynamic> route) => false);
      });
    }
  }
}
