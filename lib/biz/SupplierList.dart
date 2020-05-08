import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:flutter_hello_word/common/Loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_hello_word/utils/storage_util.dart';
import 'package:flutter_hello_word/utils/http_util.dart';

class SupplierList extends StatefulWidget {
  @override
  _SupplierList createState() => _SupplierList();
}

class _SupplierList extends State<SupplierList> {
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
      var data = {
        "status": 2,
        "pagination": {"pageNo": 1, "pageSize": 10, "total": 0}
      };
      await HttpUtil.post('/api/checkUser/listSupplier',
          data: data, headers: headers, success: (res) {
        print(res);
        setState(() {
          formList = res['data'].toList();
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
          leading: Icon(Icons.stars, size: 40, color: Colors.red),
          title: Text(item["supplierName"]),
          onTap: () {
            print(item);
            Navigator.of(context)
                .pushNamed('/SupplierDetail', arguments: item['id']);
          },
        ));
      }
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
          title: Text('审核供应商'),
          centerTitle: true,
        ),
        body: new SingleChildScrollView(
          child: _buildList(),
        ));
  }
}
