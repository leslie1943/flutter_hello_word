import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hello_word/biz/Login.dart';
import 'package:flutter_hello_word/biz/FeeHandle.dart';
import 'package:flutter_hello_word/biz/SupplierDetail.dart';

void main() {
  runApp(MaterialApp(
    title: '易普优采',
    home: Login(),
    //注册路由名称
    routes: <String, WidgetBuilder>{
      '/FeeHandle': (BuildContext context) => new FeeHandle(),
      '/FeeDetail1': (BuildContext context) => new FeeHandle(),
      '/SupplierDetail': (BuildContext context) => new SupplierDetail(),
    },
  ));
}
