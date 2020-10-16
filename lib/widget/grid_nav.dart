import 'package:flutter/material.dart';
import 'package:flutter_app/model/grid_nav_model.dart';

class GridNav extends StatefulWidget{
  final GridNavModel gridNavModel;
  final String name;

  //组件自己的构造方法以及它的一些入参,使用 @require 来标识我们的这个参数是必须的
  const GridNav({Key key,@required this.gridNavModel,this.name = 'sunywang'}) : super(key: key);

  @override
  _GirdNavState createState()=> _GirdNavState();

}

class _GirdNavState extends State<GridNav>{
  @override
  Widget build(BuildContext context) {
    return Text(widget.name);
  }
}