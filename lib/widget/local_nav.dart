import 'package:flutter/material.dart';
import 'package:flutter_app/model/common_model.dart';
import 'package:flutter_app/model/grid_nav_model.dart';

class LocalNav extends StatelessWidget{

  final List<CommonModel> localNavList;
  final String name;

  //组件自己的构造方法以及它的一些入参,使用 @require 来标识我们的这个参数是必须的
  const LocalNav({Key key,@required this.localNavList,this.name = 'sunywang'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        //设置一个值为6的圆角
        borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      child: Padding(padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }
  //一个返回 Widget 的 item 方法
  Widget _item(BuildContext context,CommonModel model){
    //使用 GestureDetector 为组件添加点击效果
    return GestureDetector(
      //在这里处理点击事件
      onTap: (){

      },
      child: Column(
        children: <Widget>[
          Image.network(
              model.icon,
              height: 32,
              width: 32,
          ),
          Text(
            model.title,
            style: TextStyle(fontSize: 12),
          )

        ],
      ),
    );
  }
  _items(BuildContext context){
    if( localNavList== null) return null;
    List<Widget> items = [];
    localNavList.forEach((model){
      items.add(_item(context,model));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }


}

