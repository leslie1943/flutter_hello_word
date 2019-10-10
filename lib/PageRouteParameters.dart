// Flutter code sample for

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'dart:convert';

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
      home: ListPage(),
    );
  }
}

class ListPage extends StatelessWidget {
  List _data = [
    {"id": 1, "name": "iphone"},
    {"id": 2, "name": "huawei"},
    {"id": 3, "name": "xiaomi"},
    {"id": 4, "name": "oppo"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 400,
        child: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) {
              return new ListTile(
                title: Text(_data[index]["name"]),
                onTap: () async {
                  String result = await Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new DetailPage(
                              _data[index]["id"], _data[index]["name"])));
                  print("result from detail page:" + result.toString());
                },
              );
            }),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  int goods_id;
  String goods_name;
  DetailPage(this.goods_id, this.goods_name);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Text("id:" + this.goods_id.toString()),
          Text("name:" + this.goods_name),
          FlatButton(
            color: Colors.cyan,
            onPressed: () {
              Navigator.pop(context,
                  "this message is from detail page:" + this.goods_name);
            },
            child: Text("返回"),
          )
        ],
      ),
    );
  }
}
