import 'package:flutter/material.dart';
import 'package:study/main.dart';
import 'package:study/navigator/router.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter知识点学习'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text("导航"),
              onTap: () async {
                print('ListTile onTap');
                var ack = await router.push(
                    name: AppRouter.secondPage,
                    arguments: {AppRouter.key: 'Hello From ListPage'});
                print('result:$ack');
              },
            ),const Divider(height: 1,)
          ],
        ));
  }
}
