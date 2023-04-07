import 'package:flutter/material.dart';
import 'package:study/main.dart';

/// @Name:           second_page.dart
/// @Description:    导航
/// @Author:         xiaofeng07
/// @CreateDate:     2023/4/3 18:12
/// @UpdateUser:     xiaofeng07
/// @UpdateDate:     2023/4/3 18:12
/// @UpdateRemark:
/// @Version:        1.0

class SecondPage extends StatelessWidget {
  final Object? params;

  const SecondPage({Key? key, this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('导航'),
        ),
        body: GestureDetector(
            child: SizedBox(
              width: MediaQuery.of(context).size.width, // 屏幕宽度
              height: MediaQuery.of(context).size.height, // 屏幕高度
              child:const Center(child:  Text('第二个页面',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
            ),
            onTap: () {
              print('params from TestList:$params');
              var ack = 'Ack From SecondPage';
              router.popRoute(params: ack);
            }));
  }
}
