import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert'; //json 数据处理
import 'package:flutter_screenutil/flutter_screenutil.dart';//ui适配

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = '获取数据中...';
  // @override
  // void initState() {
  //   print('初始化中....');
  //   // 初始化请求首页轮播
  //   getHomePageContent().then((val) {
  //     setState(() {
  //       homePageContent = val.toString();
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('api配置'),
        ),
        // 一步数据用这个
        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshot) {
            // 判断是否有值
            if (snapshot.hasData) {
              // var data = json.decode(snapshot.data['data'].toString());
              var data = snapshot.data['data'];
              List<Map> swiper = (data as List).cast();
              return Column(
                children: <Widget>[
                  SwiperDiy(
                    swiperDateList: swiper,
                  )
                ],
              );
            } else {
              return Center(
                child: Text('加载中.....'),
              );
            }
          },
        )
        // 滚动视图
        // SingleChildScrollView(
        //   child: Text(homePageContent),
        // ),
        );
  }
}

// 轮播图
class SwiperDiy extends StatelessWidget {
  final List swiperDateList;
// SwiperDiy({Key key,this.swiperDateList}):super(key:key); 官方写法
  SwiperDiy({this.swiperDateList});
  @override
  Widget build(BuildContext context) {
   //ui适配设计图尺寸 字体是否根据设计图缩放
   ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return Container(
      height: ScreenUtil().setHeight(200),
      width: ScreenUtil().setHeight(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network("${swiperDateList[index]['carousel']}",fit: BoxFit.fill,);
        },
        itemCount: swiperDateList.length,
        pagination: SwiperPagination(), //轮播导航点
        autoplay: true, //是否自动播放
      ),
    );
  }
}

// 静态
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     getHttp();
//     return Scaffold(
//       body: Center(
//         child: Text('商城首页'),
//       ),
//     );
//   }
//   // 请求get
//   void getHttp() async{
//     try{
//       Response response;
//       response = await Dio().get("http://111.231.90.86:8080/act/list");
//       return print(response);
//     }catch(e){
//       return print(e);
//     }
//   }
// }

// 动态
// class HomePage extends StatefulWidget {
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   TextEditingController typeController = TextEditingController();
//   String showText = '欢迎你来到美好人间';
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//         child: Scaffold(
//           appBar: AppBar(title: Text('美好人间'),),
//           body:Container(
//             height: 1000,
//             child: Column(
//               children: <Widget>[
//                 TextField(
//                   controller:typeController,
//                   decoration:InputDecoration (
//                     contentPadding: EdgeInsets.all(10.0),
//                     labelText: '美女类型',
//                     helperText: '请输入你喜欢的类型'
//                   ),
//                   autofocus: false,
//                 ),
//                 RaisedButton(
//                   onPressed:_choiceAction,
//                   child: Text('选择完毕'),
//                 ),

//                 Text(
//                   showText,
//                     overflow:TextOverflow.ellipsis,
//                     maxLines: 2,
//                 ),

//                 ],
//             ),
//           )
//         ),
//     );
//   }

//   void _choiceAction(){
//     print('开始选择你喜欢的类型............');
//     if(typeController.text.toString()==''){
//       showDialog(
//         context: context,
//         builder: (context)=>AlertDialog(title:Text('美女类型不能为空'))
//       );
//     }else{
//         getHttp(typeController.text.toString()).then((val){
//          setState(() {
//            showText=val['data']['name'].toString();
//          });
//         });
//     }

//   }
// // // git 请求回调
//   Future getHttp(String TypeText)async{
//     try{
//       Response response;
//       var data={'name':TypeText};
//       response = await Dio().get(
//         "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian",
//           queryParameters:data
//       );
//       return response.data;
//     }catch(e){
//       return print(e);
//     }
//   }
// // post请求请求回调
//   // Future getHttp(String TypeText)async{
//   //   try{
//   //     Response response;
//   //     var data={'name':TypeText};
//   //     response = await Dio().post(
//   //       "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian",
//   //         queryParameters:data
//   //     );
//   //     return response.data;
//   //   }catch(e){
//   //     return print(e);
//   //   }
//   // }
// }

// class HomePage extends StatefulWidget {
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String showText ="还没有请求数据";
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(title: Text('请求远程数据'),),
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               RaisedButton(
//                 onPressed: (){
//                   _jike();
//                 },
//                 child:Text('请求数据'),
//               ),
//               Text(showText)
//             ],
//           ),
//         ),
//       ),

//     );
//   }

//     void _jike(){
//       print('开始请求数据.....');
//       getHttp().then((val){
//         setState(() {
//           showText = val['data'].toString();
//         });
//       });
//     }

//    Future getHttp() async{
//      try{
//        Response response;
//        Dio dio = new Dio();
//        dio.options.headers=httpHeaders;
//        response = await dio.get('https://account.geekbang.org/serv/v1/user/auth?t=1579242151289');
//        print(response);
//       return response.data;
//      }catch(e){
//        return print(e);
//      }
//    }

// }
