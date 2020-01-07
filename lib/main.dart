import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert' as convert;
import 'package:flutter_hello_word/biz/AnotherPage.dart';

void main() {
  runApp(MaterialApp(
    title: '页面跳转返回数据',
    home: Login(),
  ));
}

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);
  GlobalKey _formKey = new GlobalKey<FormState>();

  // 赋值给某个元素
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
        ),
        body: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Form(
                      key: _formKey,
                      autovalidate: true,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            autofocus: true,
                            controller: _userNameController,
                            decoration: InputDecoration(
                                labelText: 'User name',
                                hintText: 'Please input user name',
                                icon: Icon(Icons.perm_contact_calendar)),
                            validator: (val) {
                              if (val.trim().length < 6) {
                                return 'Error: not enough length';
                              }
                              return val.trim().length > 0
                                  ? null
                                  : 'Please input user name';
                            },
                          ),
                          TextFormField(
                            autofocus: true,
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
                            onPressed: () async {
                              if ((_formKey.currentState as FormState)
                                  .validate()) {
                                // define dialog
                                AlertDialog dialog = new AlertDialog(
                                  content: new Text(
                                    '登录成功!',
                                    style: new TextStyle(
                                        fontSize: 22.0, color: Colors.green),
                                  ),
                                );
                                // Get parameters
                                var data = {
                                  "identifier": _userNameController.text,
                                  "password": _passwordController.text,
                                  "captchaCode": ""
                                };
                                Dio dio = new Dio(BaseOptions(
                                    responseType: ResponseType.json));
                                // parameter 1: request path
                                // parameter 2: request parameters
                                Response response = await dio.post(
                                    'https://epro-hospital.test.viewchain.net/epro/auth/login',
                                    data: data);
                                // 转译结果
                                var res =
                                    convert.jsonDecode(response.toString());
                                if (res["status"] == 1) {
                                  showDialog(context: context, child: dialog);
                                }
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
