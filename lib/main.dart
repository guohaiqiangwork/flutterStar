import 'package:flutter/material.dart'; //基础样式的引入
import './pages/index_page.dart'; //引入组件
void main() => runApp(MyApp());
// 快捷键  statelessW 新建一个类
class  MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '百姓生活33',
        debugShowCheckedModeBanner: false,//debugger 
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: IndexPage(),
      ),
    );
  }
}
