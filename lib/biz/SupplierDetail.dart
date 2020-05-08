import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_hello_word/utils/storage_util.dart';
import 'package:flutter_hello_word/common/Loading.dart';
import 'package:flutter_hello_word/biz/ServiceFee.dart';
import 'package:flutter_hello_word/utils/http_util.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;

class SupplierDetail extends StatefulWidget {
  @override
  _SupplierDetailState createState() => _SupplierDetailState();
}

class _SupplierDetailState extends State<SupplierDetail> {
  int supplierId = 0;
  var _supplierDetail = {};
  @override
  void initState() {
    super.initState();
    // 防止initState前加载Widget
    Future.delayed(Duration.zero, () {
      this._getSupplier();
    });
  }

  Future _getSupplier() async {
    this.supplierId = ModalRoute.of(context).settings.arguments;
    try {
      Loading loading = Loading(context);
      loading.show();
      String token = await StorageUtil.getStringItem('token');
      var headers = {'authorization': token};
      Object data = {
        'supplierId': this.supplierId,
        'nowT': new DateTime.now().toString()
      };
      await HttpUtil.get('/api/checkUser/supplierDetail',
          data: data, headers: headers, success: (res) {
        print(res);
        setState(() {
          this._supplierDetail = res;
        });
      }, error: (errorMsg) {
        Fluttertoast.showToast(
            msg: errorMsg,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      });
      loading.close();
    } catch (e) {
      print(e.toString());
    }
  }

  String validateField(val) {
    if (val != null) {
      return val;
    } else {
      return '';
    }
  }

  String getAdrress(obj) {
    return this.validateField(_supplierDetail['regAddrProvinceName']) +
        ' ' +
        this.validateField(_supplierDetail['regAddrCityName']) +
        ' ' +
        this.validateField(_supplierDetail['regAddrDistrictName']) +
        ' ' +
        this.validateField(_supplierDetail['regAddrDetail']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('供应商详情'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Card(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                        this.validateField(_supplierDetail['supplierName']),
                        style: TextStyle(fontSize: 28)),
                    subtitle: Text(
                      "注册资本:" +
                          '${this.validateField(_supplierDetail['registeredCaptial'])}' +
                          '万元',
                      style: TextStyle(color: Colors.indigoAccent),
                    ),
                  ),
                  ListTile(
                    title: Text("成立时间：" +
                        '${this.validateField(_supplierDetail['foundedTime'])}'),
                  ),
                  ListTile(
                    title: Text("联系人：" +
                        '${this.validateField(_supplierDetail['contact'])}'),
                  ),
                  ListTile(
                    title:
                        Text("注册地址：" + '${getAdrress(_supplierDetail)}'),
                  ),
                  ListTile(
                    title: Text("法定代表人：" +
                        '${this.validateField(_supplierDetail['legalPerson'])}'),
                  ),
                  ListTile(
                    title: Text("所在行业：" +
                        '${this.validateField(_supplierDetail['industry'])}'),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          RaisedButton(
                            child: Text('通过'),
                            highlightColor: Colors.yellow,
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: () {
                              print('Pass');
                            },
                          ),
                          RaisedButton(
                            textColor: Colors.white,
                            color: Colors.redAccent,
                            child: Text(
                              '驳回',
                            ),
                            onPressed: () {
                              print('Back');
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
