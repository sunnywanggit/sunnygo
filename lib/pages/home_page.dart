import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  //banner images
  List _imageUrls = [ 'https://s1.ax1x.com/2020/10/02/0QBd9x.jpg', 'https://s1.ax1x.com/2020/10/02/0QBruD.jpg', 'https://s1.ax1x.com/2020/10/02/0QBgUA.jpg' ];
  _onScroll(offset){
    print(offset);
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
                        title: Text('hahaahahahah'),
                        subtitle: Text('sub title'),
                      ),
                    )
                  ],
                ),
              )
          ),
          Opacity(
            opacity: 1,
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