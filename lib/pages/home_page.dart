import 'package:flutter/material.dart';
import 'package:flutter_app/dao/home_dao.dart';
import 'package:flutter_app/model/home_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';

//当我们滚动的距离大于 100 的时候，听不的 bar 就完全变成白色
const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  //banner images
  List _imageUrls = [ 'https://s1.ax1x.com/2020/10/02/0QBd9x.jpg', 'https://s1.ax1x.com/2020/10/02/0QBruD.jpg', 'https://s1.ax1x.com/2020/10/02/0QBgUA.jpg' ];
  double appBarAlpha = 0;
  //从服务端返回的首页结果
  String resultString = "";

  @override
  void initState(){
    super.initState();
    loadData();
  }

  _onScroll(offset){
    double alpha = offset/APPBAR_SCROLL_OFFSET;
    if(alpha<0){ alpha = 0;
    }else if(alpha > 1){ alpha = 1; }
    setState(() { appBarAlpha = alpha; });
  }

  //加载从后端获取的数据
  loadData() async {
//    HomeDao.fetch().then((res){
//      setState((){
//        resultString = json.encode(res);
//      });
//    }).catchError((error){
//      setState((){
//        resultString = json.encode(error);
//      });
//    });
    try{
      HomeModel model = await HomeDao.fetch();
      setState((){
        resultString = json.encode(model);
      });
    }catch(error){
      setState((){
        resultString = json.encode(error);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context:context,
              child: NotificationListener(
                onNotification:(scrollNotification){
                  //只有在满足是第0个元素，也就是只有 ListView 发生滚动的时候才执行 onScroll 函数
                  if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0){
                    //滚动且是列表滚动的时候
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 160,
                      child: Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context,int index){
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                    Container(
                      height: 800,
                      child: ListTile(
                        title: Text(resultString),
                        subtitle: Text('sub title'),
                      ),
                    )
                  ],
                ),
              )
          ),
          Opacity(
            opacity: appBarAlpha,
            child:Container(
              height: 60,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('首页'),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}