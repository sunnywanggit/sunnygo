//config	Object	NonNull
//bannerList	Array	NonNull
//localNavList	Array	NonNull
//gridNav	Object	NonNull
//subNavList	Array	NonNull
//salesBox	Object	NonNull

import 'package:flutter_app/model/common_model.dart';
import 'package:flutter_app/model/config_model.dart';
import 'package:flutter_app/model/grid_nav_model.dart';
import 'package:flutter_app/model/sales_box_model.dart';

class HomeModel {
  final ConfigModel config;
  final GridNavModel gridNav;
  final SalesBoxModel salesBox;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;

  HomeModel({this.subNavList,this.salesBox,this.config,this.bannerList,this.localNavList,this.gridNav});

  factory HomeModel.fromJson(Map<String,dynamic>json){
    var bannerListJson = json['bannerList'] as List;
    List<CommonModel> bannerList = bannerListJson.map((item)=>CommonModel.fromJson(item)).toList();

    var localNavListJson = json['localNavList'] as List;
    List<CommonModel> localNavList = localNavListJson.map((item)=>CommonModel.fromJson(item)).toList();

    var subNavListJson = json['subNavList'] as List;
    List<CommonModel> subNavList = subNavListJson.map((item)=>CommonModel.fromJson(item)).toList();

    return HomeModel(
      localNavList: localNavList,
      bannerList: bannerList,
      subNavList: subNavList,
      config: ConfigModel.fromJson(json['config']), 
      gridNav: GridNavModel.fromJson(json['gridNav']),
      salesBox: SalesBoxModel.fromJson(json['salesBox'])
    );
  }
}





