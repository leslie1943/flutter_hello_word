import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_hello_word/utils/storage_util.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List formList;
  @override
  void initState() {
    super.initState();
    getData().then((res) {
      setState(() {
        formList = res['result']['hospitals'].toList();
      });
    });
  }

  Future getData() async {
    try {
      Response response;
      // 获取请求token
      String token = await StorageUtil.getStringItem('token');
      Options options = Options(headers: {"authorization": token});
      Dio dio = new Dio();
      // parameter 1: request path
      // parameter 2: request parameters
      response = await dio.get(
          'https://epro-op.test.viewchain.net/opapi/api/statistic/bigscreen?nowT=1578551906215',
          options: options);
      var res = convert.jsonDecode(response.toString());
      if (res['status'] == 1) {
        return res;
      } else {
        Fluttertoast.showToast(
            msg: res['msg'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    } catch (e) {
      print(e);
    }
  }

  Widget _buildList() {
    List<Widget> tiles = [];
//    List<Widget> tiles = new List<Widget>();
    Widget content; // 单独的一个widget组件,返回需要生成的内容
    if (this.formList != null) {
      for (var item in this.formList) {
        print(item);
        tiles.add(new ListTile(
          leading: Icon(Icons.local_hospital, size: 40, color: Colors.red),
          title: Text(item["name"]),
          subtitle: Text('供应商数量:${item['supplierNum']}'),
        ));
      }
      tiles.add(new Container(
        child: RaisedButton(
          child: Text('返回'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            Navigator.pop(context, '返回登录');
          },
        ),
      ));
      content = new Column(
        children: tiles,
      );
      return content;
    } else {
      tiles.add(new Center(
        child: Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.amber[600],
            child: Text('No data found!')),
      ));
      tiles.add(new Container(
        child: RaisedButton(
          child: Text('返回'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            Navigator.pop(context, '返回登录');
          },
        ),
      ));
      content = new Column(
        children: tiles,
      );
      return content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('医院列表'),
          centerTitle: true,
        ),
        body: new SingleChildScrollView(
          child: _buildList(),
        ));
  }
}