import 'dart:async';
//因为我们有可能回去做一些模型的转换，所以需要用到这个包
import 'dart:convert';
import 'package:flutter_app/model/home_model.dart';
import 'package:http/http.dart' as http;

//接口地址
const HOME_URL = 'http://www.devio.org/io/flutter_app/json/home_page.json';

class HomeDao{
  static Future<HomeModel> fetch() async{
    final response = await http.get(HOME_URL);
    if(response.statusCode ==  200){
      Utf8Decoder utf8decoder = Utf8Decoder();

    }

  }
}
