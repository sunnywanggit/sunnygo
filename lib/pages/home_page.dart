import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  //banner images
  List _imageUrls = [ 'https://s1.ax1x.com/2020/10/02/0QBd9x.jpg', 'https://s1.ax1x.com/2020/10/02/0QBruD.jpg', 'https://s1.ax1x.com/2020/10/02/0QBgUA.jpg' ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        context:context,
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
    );
  }
}