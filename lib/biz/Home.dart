import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;

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
      print('res');
      print(res);
      setState(() {
        formList = res['result']['hospitals'].toList();
      });
    });
  }

  Future getData() async {
    try {
      Response response;
      var basicAuth =
          "eyJhbGciOiJIUzUxMiJ9.eyJjcmVhdGVkIjoxNTc4NDkwODY2Mjk5LCJuYW1lIjoiYWRtaW4iLCJhZG1pbiI6MSwiaWQiOjJ9.H2-107JJ5kO18vzAbkqJG5612FXfFllAWtOrQbeCIU0FGxCyTQl6L-IxF4Pmsk7tSwaWZKy9skmKdybayjBNLA";
      Options options = Options(headers: {"authorization": basicAuth});
      Dio dio = new Dio();
      // parameter 1: request path
      // parameter 2: request parameters
      response = await dio.get(
          'https://epro-op.test.viewchain.net/opapi/api/statistic/bigscreen?nowT=1578473341421',
          options: options);
      var res = convert.jsonDecode(response.toString());
      return res;
    } catch (e) {
      print(e);
    }
  }

  Widget _buildList() {
    List<Widget> tiles = [];
    Widget content; // 单独的一个widget组件,返回需要生成的内容
    for (var item in formList) {
      print(item);
      tiles.add(new ListTile(
        leading: Icon(Icons.local_hospital, size: 40, color: Colors.red),
        title: Text(item["name"]),
        subtitle: Text('供应商数量:${item['supplierNum']}'),
      ));
    }
    tiles.add(new Container(
      child:  RaisedButton(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('注册医院'),
          centerTitle: true,
        ),
        body: new SingleChildScrollView(
          child: _buildList(),
        )
    );
  }
}
