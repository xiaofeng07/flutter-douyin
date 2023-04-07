import 'package:flutter/material.dart';
import 'package:flutter_douyin/data/net/test.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: TextButton(onPressed: (){
      getHttp();
    }, child: Text("网络请求")),);
  }
}
