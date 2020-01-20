import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_shop/config/servcie_url.dart';
// import '../config/httpHeaderrs.dart';
// get 请求数据接口
Future getHttpData(url,{ketwords})async{
  try{
    print('获取数据.....');
    Response response;
    Dio dio = new Dio();
    if(ketwords == null){
       response = await dio.get(servicePath[url]);
    }else{
       response = await dio.get(servicePath[url].toString() + '?' + ketwords.toString());
    }
    if(response.statusCode == 200){
      if(url == 'categoryContent'){
        print(response.data);
      }
      return response.data;
    }else{
      throw Exception('请求楼层数据失败.......');
    }
  }catch(e){
    return print(e.message.toString());
  }
}

// post 请求数据接口
Future postHttpData(url,{ketwords})async{
  try{
    print('获取数据.....');
    Response response;
    Dio dio = new Dio();
    if(ketwords == null){
       response = await dio.post(servicePath[url]);
    }else{
       response = await dio.post(servicePath[url],data :ketwords);
 
    }
    if(response.statusCode == 200){
      return response.data;
    }else{
      throw Exception('请求楼层数据失败.......');
    }
  }catch(e){
    return print(e.message.toString());
  }
}
// get 请求数据接口
Future getHttpDataP()async{
  try{
    Response response;
    Dio dio = new Dio();
    response = await dio.get('http://111.231.90.86:8080/sort/selectSortC/01');
    if(response.statusCode == 200){
      return response.data;
    }else{
      throw Exception('请求楼层数据失败.......');
    }
  }catch(e){
    return print(e.message.toString());
  }
}
