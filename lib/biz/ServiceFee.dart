import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:flutter_hello_word/common/Loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_hello_word/utils/storage_util.dart';
import 'package:flutter_hello_word/biz/FeeHandle.dart';

class ServiceFee extends StatefulWidget {
  @override
  _ServiceFeeState createState() => _ServiceFeeState();
}

class _ServiceFeeState extends State<ServiceFee> {
  List formList;
  // 定义全局 context; 为loading对象传递可用参数
  BuildContext _context;
  @override
  void initState() {
    super.initState();
    getData().then((res) {
      setState(() {
        formList = res['result']['data'].toList();
      });
    });
  }

  Future getData() async {
    try {
      Response response;
      // 获取请求token
      String token = await StorageUtil.getStringItem('token');
      Options options = Options(headers: {"authorization": token});
      Loading loading = Loading(_context);
      loading.show();
      Dio dio = new Dio();
      var data = {
//        'status': [1, 2, 3, 7],
        'status': [2, 7],
        'pagination': {'pageSize': 500, 'pageNo': 1}
      };
      response = await dio.post(
          'https://epro-op.test.viewchain.net/opapi/api/serviceFee/getServiceFeeList',
          options: options,
          data: data);
      print('response');
      print(response);
      var res = convert.jsonDecode(response.toString());
      loading.close();
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
    int counter = 1;
    final pays = [
      {'name': '未设置'},
      {'name': '线上付款'},
      {'name': '线下付款'},
      {'name': '自动'}
    ];
//    List<Widget> tiles = new List<Widget>();
    Widget content; // 单独的一个widget组件,返回需要生成的内容
    if (this.formList != null) {
      for (var item in this.formList) {
        if (!(item['status'] == 3 || item['feeAmount'] == 0)) {
          tiles.add(new ListTile(
            leading: item['status'] == 3
                ? Icon(Icons.tag_faces, size: 30, color: Colors.green)
                : Icon(Icons.add_alert, size: 30, color: Colors.orangeAccent),
            title: Text(
                '${counter.toString() + ':' + item["feeNo"]} -- ${pays[item['payMethod']]['name']}'),
            subtitle: Text('${item['supplierName']} : ${item['feeAmount']}元'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('on tap');
              print(item);
              Navigator.of(context)
                  .pushNamed('/FeeHandle', arguments: item['feeNo']);
            },
          ));
          counter++;
        } else {
          print('已完成收费或无需收费');
        }
      }
      if(counter == 1){
        tiles.add(new Center(
          child: Text('暂无数据.'),
        ));
      }
//      tiles.add(new Container(
//        child: RaisedButton(
//          child: Text('返回'),
//          color: Colors.blue,
//          textColor: Colors.white,
//          onPressed: () {
//            Navigator.pop(context, '返回登录');
//          },
//        ),
//      ));
      content = new Column(
        children: tiles,
      );
      return content;
    } else {
      return new Center(
        child: Text('暂无数据'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Scaffold(
        appBar: AppBar(
          title: Text('收费列表'),
          centerTitle: true,
        ),
        body: new SingleChildScrollView(
          child: _buildList(),
        ));
  }
}
