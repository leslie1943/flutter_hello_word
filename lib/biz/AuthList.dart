import 'package:flutter/material.dart';

class AuthList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('代码测试'),
          centerTitle: true,
        ),
        body: Padding(
          // 下面4种都可以实现上下左右padding 20效果
          padding: EdgeInsets.all(20.0),
          // padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          // padding: EdgeInsets.only(left: 20.0,top: 20.0,right: 20.0,bottom: 20.0),
          // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
          child: Container(
            height: 100,
            width: 200,
            color: Colors.green,
            child: Text('我被padding了20px',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)),
          ),
        ));
  }
}
