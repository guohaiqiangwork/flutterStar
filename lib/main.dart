import 'package:flutter/material.dart'; //基础样式的引入
import './pages/index_page.dart'; //引入组件
import 'package:provide/provide.dart';
import './provide/counter.dart';
import './provide/child_category.dart';

// void main() => runApp(MyApp());
void main() {
  var counter = Counter();//测试
  var childCategory = ChildCategory();//分类
  var providers = Providers();
  providers 
   ..provide(Provider<Counter>.value(counter))
   ..provide(Provider<ChildCategory>.value(childCategory));//<组件名>
   runApp(ProviderNode(child: MyApp(),providers: providers));
}
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
