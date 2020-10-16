import 'package:flutter/material.dart';
import 'package:flutter_app/model/grid_nav_model.dart';

class GridNav extends StatelessWidget{
  final GridNavModel gridNavModel;
  final String name;

  //组件自己的构造方法以及它的一些入参,使用 @require 来标识我们的这个参数是必须的
  const GridNav({Key key,@required this.gridNavModel,this.name = 'sunywang'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(name);
  }
}

