import 'package:flutter/material.dart';
import 'package:flutter_hello_word/common/Loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_hello_word/utils/storage_util.dart';
import 'package:flutter_hello_word/utils/http_util.dart';

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
    _getData();
  }

  Future _getData() async {
    try {
      String token = await StorageUtil.getStringItem('token');
      var headers = {"authorization": token};
      Loading loading = Loading(_context);
      loading.show();
      var data = {
        'status': [2, 7],
        'pagination': {'pageSize': 500, 'pageNo': 1}
      };
      await HttpUtil.post('/api/serviceFee/getServiceFeeList',
          data: data, headers: headers, success: (res) {
        setState(() {
          formList = res['pageData']['data'].toList();
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
    int counter = 1;
    final pays = [
      {'name': '未设置'},
      {'name': '线上付款'},
      {'name': '线下付款'},
      {'name': '自动'}
    ];
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
              Navigator.of(context)
                  .pushNamed('/FeeHandle', arguments: item['feeNo']);
            },
          ));
          counter++;
        } else {
          print('已完成收费或无需收费');
        }
      }
      if (counter == 1) {
        tiles.add(new Center(
          child: Text('暂无数据.'),
        ));
      }
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
