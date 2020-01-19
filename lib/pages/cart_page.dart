import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Number(),
            Mybutton(),
          ],
        ),
      ),
    );
  }
}

// 数字
class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child:Provide<Counter>(
        builder: (context,child,counter){
          return Text('${counter.value}');
        },
      )
      
     
    );
  }
}

class Mybutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child:RaisedButton(
          onPressed: (){
            Provide.value<Counter>(context).increment();
          },
          child: Text('递增'),
      )
    );
  }
}