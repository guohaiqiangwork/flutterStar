import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_shop/config/servcie_url.dart';
// import '../config/httpHeaderrs.dart';

// 获取首页内容
Future getHomePageContent() async {
  try {
    print('开始获取首页数据。。。。');
    Response response;
    Dio dio = new Dio();
    // dio.options.contentType = ContentType.parse("application/x-www-from-urlencoded"); //from表单请求
    // var fromData = {'ion': '115.02932', 'lat': '35.76189'};
    response = await dio.get(servicePath['homePageContent']);//参数跟在后面 (servicePath['homePageContent'],data: fromData)
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('请求失败首页数据');
    }
  } catch (e) {
    return print('系统错误首页');
  }
}
// 获取分类
Future getTopNavigatorConent()async{
  try{
    print('获取分类数据.....');
    Response response;
    Dio dio = new Dio();
    response = await dio.get(servicePath['topNavigatorConent']);
    if(response.statusCode == 200){
      return response.data;
    }else{
      throw Exception('请求分类数据失败.......');
    }
  }catch(e){
    return print(e.message.toString() + '分类数据');
  }
}
