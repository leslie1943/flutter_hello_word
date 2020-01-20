import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_hello_word/utils/storage_util.dart';
import 'package:flutter_hello_word/common/Loading.dart';
import 'dart:convert' as convert;
import 'package:flutter_hello_word/utils/baseUrl.dart';
import 'package:flutter_hello_word/biz/ServiceFee.dart';
import 'package:flutter_hello_word/utils/http_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeeHandle extends StatefulWidget {
  @override
  _FeeHandleState createState() => _FeeHandleState();
}

class _FeeHandleState extends State<FeeHandle> {
  var _currentFee = {};
  String paramNo = '';
  @override
  // 生命周期方法
  void initState() {
    super.initState();
    // 防止initState前加载Widget
    Future.delayed(Duration.zero, () {
      this._getCurrentFee();
    });
  }

  // 调用接口初始数据.
  Future _getCurrentFee() async {
    try {
      Loading loading = Loading(context);
      loading.show();
      String token = await StorageUtil.getStringItem('token');
      var headers = {'authorization': token};
      var data = {
        'feeNo': this.paramNo,
        'type': 2,
        'nowT': new DateTime.now().toString()
      };
      await HttpUtil.get('/api/serviceFee/getServiceFeeDetail',
          data: data, headers: headers, success: (res) {
        setState(() {
          this._currentFee = res;
        });
      }, error: (errorMsg) {
        Fluttertoast.showToast(
            msg: errorMsg,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      });
      loading.close();
    } catch (e) {
      print(e.toString());
    }
  }

  Widget build(BuildContext context) {
    paramNo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('收费详情'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                child: Center(
                  child: Image.network(
                    _currentFee['proofUrl'] != null
                        ? _currentFee['proofUrl']
                        : 'https://images.unsplash.com/photo-1558980394-a3099ed53abb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
//                    width: 200.0,
//                    height: 200.0,
                  ),
                ),
              ),
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                borderOnForeground: true,
                clipBehavior: Clip.none,
                semanticContainer: false,
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('服务单号:' +
                                '${_currentFee['serviceFeeVO']['feeNo']}'),
                            Text(
                              '服务单金额(元):' +
                                  '${_currentFee['serviceFeeVO']['feeAmount']}元',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                            Text('付款渠道:' +
                                '${_currentFee['serviceFeeVO']['payMethod']}'),
                            Text('状 态:' +
                                '${_currentFee['serviceFeeVO']['status']}'),
                            Text('创建时间	:' +
                                '${_currentFee['serviceFeeVO']['createTime']}'),
                            Text('付款时间	:' +
                                '${_currentFee['serviceFeeVO']['payTime']}'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                borderOnForeground: true,
                clipBehavior: Clip.none,
                semanticContainer: false,
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('企业名称:' +
                                '${_currentFee['supplierDetailVO']['company']}'),
                            Text('公司电话:' +
                                '${_currentFee['supplierDetailVO']['companyPhone']}'),
                            Text('联系人:' +
                                '${_currentFee['supplierDetailVO']['contact']}'),
                            Text('联系电话:' +
                                '${_currentFee['supplierDetailVO']['contactPhone']}'),
                            Text('注册账号:' +
                                '${_currentFee['supplierDetailVO']['account']}'),
                            Text('注册手机:' +
                                '${_currentFee['supplierDetailVO']['registerPhone']}'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                borderOnForeground: true,
                clipBehavior: Clip.none,
                semanticContainer: false,
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('项目名称:' +
                                '${_currentFee['projectVOs'][0]['projectName']}'),
                            Text('项目编号:' +
                                '${_currentFee['projectVOs'][0]['projectCode']}'),
                            Text('需方名称:' +
                                '${_currentFee['projectVOs'][0]['hospitalName']}'),
                            Text('技术服务费率:' +
                                '${_currentFee['projectVOs'][0]['feeRate']}%'),
                            Text('成交金额(元):' +
                                '${_currentFee['projectVOs'][0]['finalPrice']}'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  '确认收款',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  try {
                    Loading loading = new Loading(context);
                    loading.show();
                    String token = await StorageUtil.getStringItem('token');
                    var headers = {"authorization": token};
                    var payload = {
                      'payNo': this._currentFee['serviceFeeVO']['payNo'],
                      'status': 3
                    };
                    HttpUtil.post('/api/serviceFee/updateReceiptPay',
                        data: payload, headers: headers, success: (res) {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new ServiceFee()));
                    }, error: (errorMsg) {
                      Fluttertoast.showToast(
                          msg: errorMsg,
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
                },
              )
            ],
          ),
        ));
  }
}
