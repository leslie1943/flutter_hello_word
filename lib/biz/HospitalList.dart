import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:flutter_hello_word/common/Loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_hello_word/utils/storage_util.dart';
import 'package:flutter_hello_word/utils/http_util.dart';

class HospitalList extends StatefulWidget {
  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  List formList;
  // 定义全局 context; 为loading对象传递可用参数
  BuildContext _context;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    try {
      String token = await StorageUtil.getStringItem('token');
      var headers = {"authorization": token};
      Loading loading = Loading(_context);
      loading.show();
      await HttpUtil.get('/api/statistic/bigscreen',
          data: null, headers: headers, success: (res) {
        setState(() {
          formList = res['hospitals'].toList();
        });
      }, error: (errMsg) {
        Fluttertoast.showToast(
            msg: errMsg,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      });
      loading.close();
    } catch (e) {
      print(e);
    }
  }

  Widget _buildList() {
    List<Widget> tiles = [];
    Widget content; // 单独的一个widget组件,返回需要生成的内容
    if (this.formList != null) {
      for (var item in this.formList) {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
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
