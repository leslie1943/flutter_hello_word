import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;
import 'package:flutter_hello_word/biz/Home.dart';
import 'package:flutter_hello_word/common/Loading.dart';
import 'package:flutter_hello_word/utils/storage_util.dart';

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);
  final GlobalKey _formKey = new GlobalKey<FormState>();
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  // 赋值给表单元素
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _userNameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text('易普优采'),
          centerTitle: true,
        ),
        body: Builder(builder: (BuildContext context) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: new Center(
              child: new Column(
                children: <Widget>[
                  Container(
                    child: Image.asset('static/image/epro.jpg'),
                  ),
                  Container(
                      child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          autofocus: true,
                          controller: _userNameController,
                          decoration: InputDecoration(
                              labelText: 'User name',
                              hintText: 'User name',
                              icon: Icon(Icons.perm_contact_calendar)),
                          validator: (val) {
                            if (val.trim().length < 6) {
                              return 'Not enough length';
                            }
                            return val.trim().length > 0
                                ? null
                                : 'User name is required';
                          },
                        ),
                        TextFormField(
                          autofocus: false,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              labelText: 'password',
                              hintText: 'Please input password',
                              icon: Icon(Icons.remove_red_eye)),
                          obscureText: true,
                        ),
                        RaisedButton(
                          child: Text('Login'),
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () async {
                            if ((_formKey.currentState as FormState)
                                .validate()) {
                              Loading loading = Loading(context);
                              loading.show();
                              // Get parameters
                              var data = {
                                "identifier": _userNameController.text,
                                "password": _passwordController.text,
                              };
                              Dio dio = new Dio();
                              // parameter 1: request path
                              // parameter 2: request parameters
                              Response response = await dio.post(
                                'https://epro-op.test.viewchain.net/opapi/auth/login?identifier=${data['identifier']}&password=${data['password']}',
                              );
                              // 转译结果
                              var res = convert.jsonDecode(response.toString());
                              if (res["status"] == 1) {
                                // 设置登录token
                                StorageUtil.setStringItem(
                                    'token', res['result']['token']);
                                loading.close();
                                final snackBar = SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('登录成功!'),
                                  backgroundColor: Colors.green,
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => new Home()));
                              } else {
                                loading.close();
                                final snackBar = SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('登录失败!'),
                                  backgroundColor: Colors.red,
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                              }
                            }
                          },
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          );
        }));
  }
}
