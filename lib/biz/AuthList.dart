import 'package:flutter/material.dart';

class AuthList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('代码测试'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: DecoratedBox(
            // decoration
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.redAccent, Colors.blue]),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [ // 数组
                  BoxShadow(
                      color: Colors.black45, // 阴影颜色
                      offset: Offset(20.0, 80.0), // 阴影与容器的距离, x轴,y轴
                      blurRadius: 6.0),
                // // 模糊程度
                ]),
            // the decorated container.
            child: Container(
              height: 200.0,
            ),
          ),
        ));
  }
}
