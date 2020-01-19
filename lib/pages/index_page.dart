// 静态组件start --StatelessWidget
import 'package:flutter/material.dart'; //安卓风格样式
import 'package:flutter/cupertino.dart'; //ios 风格

// 页面引入
import 'home_page.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'member_page.dart';
//第三方库引入
import 'package:flutter_screenutil/flutter_screenutil.dart'; //ui适配

// class IndexPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('百姓生活+'),),
//       body: Center(
//         child: Text('百姓生活+99'),
//         ),
//     );
//   }
// }
// 静态组件end

// 动态组件satrt
class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('个人中心'))
  ];
  // 重新加载页面
  // final List tabBodies =[
  //   HomePage(),
  //   CartPage(),
  //   CategoryPage(),
  //   MemberPage()
  // ];
// 页面不重新加载
  final List <Widget> tabBodies =[
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];
  int currentIndex = 0;
  var currentPage;
  // 初始化
  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ui适配初始化
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs, //tab 数据
        // 单击事件
        onTap: (index) {
          // 改变样式 刷新页面
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      // 内容展示每次重新加载
      // body:currentPage ,
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      ),
    );
  }
}
