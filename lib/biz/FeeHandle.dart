import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_hello_word/utils/storage_util.dart';
import 'package:flutter_hello_word/common/Loading.dart';
import 'dart:convert' as convert;
import 'package:flutter_hello_word/utils/request.dart';
import 'package:flutter_hello_word/biz/ServiceFee.dart';

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
    _getCurrentFee().then((res) {
      setState(() {
        _currentFee = res;
      });
    });
  }

  // 调用接口初始数据.
  Future _getCurrentFee() async {
    try {
      print(paramNo);
      Response response = new Response();
      String token = await StorageUtil.getStringItem('token');
      Options options = Options(headers: {"authorization": token});
      Loading loading = Loading(context);
      loading.show();
      Dio dio = new Dio();
      String path = RequestUtil.getServerUrl() +
          '/api/serviceFee/getServiceFeeDetail?feeNo=' +
          this.paramNo +
          '&type=2&nowT=' +
          new DateTime.now().toString();
      response = await dio.get(
        path,
        options: options,
      );
      var res = convert.jsonDecode(response.toString());
      loading.close();
      return res['result'];
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
                padding: EdgeInsets.all(20.0),
//                elevation: 5.0,
                child: Center(
                  child: Image.network(_currentFee['proofUrl'],width: 200.0,height: 200.0,),
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
                  Response response = new Response();
                  Loading loading = new Loading(context);
                  loading.show();
                  Dio dio = new Dio();
                  print('request');
                  print(this._currentFee);
                  var payload = {
                    'payNo': this._currentFee['serviceFeeVO']['payNo'],
                    'status': 3
                  };
                  print('payload');
                  print(payload);
                  String token = await StorageUtil.getStringItem('token');
                  Options options = Options(headers: {"authorization": token});
                  String path = RequestUtil.getServerUrl() +
                      '/api/serviceFee/updateReceiptPay';
                  response = await dio.post(
                    path,
                    data: payload,
                    options: options,
                  );
                  var res = convert.jsonDecode(response.toString());
                  print('after');
                  print(res);
                  if (res['status'] == 1 && res['result'] == true) {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new ServiceFee()));
                  }
                },
              )
            ],
          ),
        ));
  }
}
