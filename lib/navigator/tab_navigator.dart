import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/my_page.dart';
import 'package:flutter_app/pages/search_page.dart';
import 'package:flutter_app/pages/travel_page.dart';

class TabNavigator extends StatefulWidget{
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

//在定义内部类的时候我们需要在前面加上一个下划线
class _TabNavigatorState extends State<TabNavigator>{
  //未选中时的颜色
  final _defaultColor = Colors.grey;
  //选中时的颜色
  final _activeColor = Colors.blue;
  //当前选中的 index
  int _currentIndex = 0;
  final PageController _controller = PageController(
    //初始化的时候显示第0个tab
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        //引入tab栏所对应的页面
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type:BottomNavigationBarType.fixed ,
        items: [
          BottomNavigationBarItem(
            icon:Icon( Icons.home, color:_defaultColor , ),
            activeIcon: Icon( Icons.home, color:_activeColor, ),
            title:Text('首页',style:TextStyle(
              color: _currentIndex != 0 ? _defaultColor : _activeColor
            ) ,)
          ),
          BottomNavigationBarItem(
              icon:Icon( Icons.search, color:_defaultColor , ),
              activeIcon: Icon( Icons.search, color:_activeColor, ),
              title:Text('搜索',style:TextStyle(
                  color: _currentIndex != 1 ? _defaultColor : _activeColor
              ) ,)
          ),
          BottomNavigationBarItem(
              icon:Icon( Icons.camera, color:_defaultColor , ),
              activeIcon: Icon( Icons.camera, color:_activeColor, ),
              title:Text('旅拍',style:TextStyle(
                  color: _currentIndex != 2 ? _defaultColor : _activeColor
              ) ,)
          ),
          BottomNavigationBarItem(
              icon:Icon( Icons.account_circle, color:_defaultColor , ),
              activeIcon: Icon( Icons.account_circle, color:_activeColor, ),
              title:Text('我的',style:TextStyle(
                  color: _currentIndex != 3 ? _defaultColor : _activeColor
              ) ,)
          ),
        ]
      ),


    );
  }

}