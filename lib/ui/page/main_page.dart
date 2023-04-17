import 'package:flutter/material.dart';
import 'package:flutter_douyin/ui/page/friends_page.dart';
import 'package:flutter_douyin/ui/page/home_page.dart';
import 'package:flutter_douyin/ui/page/message_page.dart';
import 'package:flutter_douyin/ui/page/profile_page.dart';
import 'package:flutter_douyin/ui/theme/theme.dart';

/// @Name:           ScaffoldRoute
/// @Description:    主框架
/// @Author:         xiaofeng07
/// @CreateDate:     2023/4/4 13:25
/// @UpdateUser:     xiaofeng07
/// @UpdateDate:     2023/4/4 13:25
/// @UpdateRemark:
/// @Version:        1.0
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List _pageList = [
    HomePage(),
    FriendPage(),
    MessagePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pageList[_selectedIndex],
        bottomNavigationBar: Tab(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      _onItemTapped(0);
                    },
                    child:  Text(
                      "首页",
                      style: TextStyle(fontWeight: FontWeight.bold,color: getColor(0)),
                    )),
                GestureDetector(
                    onTap: () {
                      _onItemTapped(1);
                    },
                    child:  Text("朋友",
                        style: TextStyle(fontWeight: FontWeight.bold,color: getColor(1)))),
                GestureDetector(
                  child: Container(
                      decoration:BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(width: 1,color: Colors.white)),
                    child:  const Icon(Icons.add)
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                    onTap: () {
                      _onItemTapped(2);
                    },
                    child:  Text("消息",
                        style: TextStyle(fontWeight: FontWeight.bold,color: getColor(2)))),
                GestureDetector(
                    onTap: () {
                      _onItemTapped(3);
                    },
                    child:  Text("我",
                        style: TextStyle(fontWeight: FontWeight.bold,color: getColor(3)))),
              ], //均分底部导航栏横向空间
            )));
  }

  Color getColor(int index){
    if(index==_selectedIndex){
      return Colors.white;
    }else{
      return Colors.grey;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
