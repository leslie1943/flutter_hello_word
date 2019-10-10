// Flutter code sample for

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyIcon.dart';
import 'dart:math' as math;
import 'pages/BusPage.dart';
import 'pages/PlanePage.dart';
import 'pages/MyPage.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String _data = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () async {
              Dio dio = new Dio();
              // Http get
              Response res = await dio.get('http://www.baidu.com',
                  queryParameters: {"userName": 'good', "password": "1234"});

//              http post
//              dio.post('http://www.baidu.com',data: {"userName": 'good', "password": "1234"});

//              http download
//              dio.download('https://www.baidu.com/logo.png', 'myComputerUrl');
              print("result:" + res.toString());
              setState(() {
                _data = res.data.toString();
              });
            },
            child: (Text('Send http request')),
            color: Colors.cyan,
          ),
          Scrollbar(
            child: Container(
              height: 400,
              child: SingleChildScrollView(
                child: Text(_data),
              ),
            ),
          )
        ],
      ),
    );
  }
}
