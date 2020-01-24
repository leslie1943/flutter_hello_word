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
          height: 100.0,
          width: 100.0,
          color: Colors.black26,
          child: OverflowBox(
            maxWidth: 80.0,
            minWidth: 50.0,
            minHeight: 50.0,
            maxHeight: 80.0,
            child: Container(
              width: 100.0,
              height: 200.0,
              color: Colors.blue,
              child: (
              Text('Hello 2020')
              ),
            ),
          ),
        )
    );
  }
}
