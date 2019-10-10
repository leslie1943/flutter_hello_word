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
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List _address = [{"address":"No data"}];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Just do it'),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () async {
              Dio dio = new Dio();
              Response res = await dio.get(
                  'https://www.ele.me/restapi/bgs/poi/search_poi_nearby?geohash=wwymrkj0tm6k&keyword=%E9%AB%98%E6%96%B0%E5%8C%BA&latitude=38.913689&limit=20&longitude=121.614761&type=nearby');
//              print('result:' + res.data.toString());
//              List items = json.decode(res.data.toString());
              List items = res.data;
              items.forEach((f)=>print(f['address']));
              setState(() {
                _address = items;
              });
            },
            child: Text('Request api'),
          ),
          Container(
//            alignment: Alignment.topRight,
            height: 200,
            child: ListView(
                children: _address.map((item) => Text(item['address'])).toList()
            ),
          )
        ],
      ),
    );
  }
}
