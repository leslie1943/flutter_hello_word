// Flutter code sample for

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyIcon.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

void open2ndPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'This is the second page',
            style: TextStyle(fontSize: 24, color: Colors.lightBlueAccent),
          ),
        ),
      );
    },
  ));
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  // formKey是非常重要的属性,用来标识整个表单
  GlobalKey _formKey = new GlobalKey<FormState>();

  // 赋值给某个元素
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // define common style
    const styles = TextStyle(
      // 0x表示16进制
      // ff表示透明度
        color: const Color(0xff5aaafa), //Colors.blueAccent,
        fontSize: 20,
        fontFamily: 'YaHei',
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.dashed);

    // 解耦获取值
    _passwordController.addListener(() {
      print(_passwordController.text);
    });

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Welcome page'),
          centerTitle: true,
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back), onPressed: () {}),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                scaffoldKey.currentState.showSnackBar(snackBar);
              },
            )
          ],
        ),
        body: Flex(
          direction: Axis.vertical,
          children: <Widget>[
//            Expanded(
//              flex: 1,
//              child: Text(
//                'Hello body, ',
//                textAlign: TextAlign.left,
//                maxLines: 2,
//                overflow: TextOverflow.ellipsis,
//                textScaleFactor: 1.4,
//              ),
//            ),
//            Expanded(
//              flex: 1,
//              child: Text(
//                'Style test',
//                style: styles,
//              ),
//            ),
//            Expanded(
//              flex: 1,
//              child: Text.rich(TextSpan(children: [
//                TextSpan(
//                    text: 'Start section',
//                    style: TextStyle(
//                        color: Colors.deepOrangeAccent, fontSize: 24)),
//                TextSpan(
//                    text: 'Middle section',
//                    style: TextStyle(color: Colors.cyan, fontSize: 20)),
//                TextSpan(
//                    text: 'End section',
//                    style: TextStyle(color: Colors.black26))
//              ])),
//            ),
            Expanded(
                flex: 1,
                child: Flex(direction: Axis.horizontal, children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: FlatButton(
                        child: Text("FlatButton"),
                        onPressed: () => {print("FlatButton pressed.")},
                      )),
                  Expanded(
                      flex: 1,
                      child: OutlineButton(
                        child: Text("OutlineButton"),
                        onPressed: () => {print("OutlineButton pressed.")},
                      )),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: const Icon(Icons.add_alert),
                        tooltip: 'Show Snackbar',
                        onPressed: () {
                          scaffoldKey.currentState.showSnackBar(snackBar);
                        },
                      )),
                  Expanded(
                      flex: 1,
                      child: FlatButton(
                        child: Text("FlatButton Customer"),
                        color: Colors.blueGrey,
                        textColor: Colors.cyan,
                        highlightColor: Colors.deepOrangeAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () =>
                        {print("FlatButton Customer pressed.")},
                      ))
                ])),
//            Expanded(
//                flex: 1,
//                child: Flex(direction: Axis.horizontal, children: <Widget>[
//                  Expanded(
//                      flex: 1,
//                      child: Image.asset(
//                        'static/image/pic_1.jpeg',
//                        width: 200,
//                      )),
//                  Expanded(
//                    flex: 1,
//                    child: Image.network(
//                        'https://avatar.csdn.net/7/9/8/3_jerrywu145.jpg',
//                        color: Colors.pink,
//                        colorBlendMode: BlendMode.dst),
//                  ),
//                ])),
            Expanded(
              flex: 1,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.access_alarms),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        MyIcon.huawei,
                        color: Colors.blue,
                      )),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      MyIcon.xiaomi,
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: new MyDropDownButton(),
                  ),
                  Expanded(flex: 1, child: new SwitchAndCheckBoxComponent()),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: '请输入用户名',
                          prefixIcon: Icon(Icons.assignment_ind)),
                      keyboardType: TextInputType.text,
                      onChanged: (val) {
                        print('用户名$val');
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: "密码",
                          hintText: '请输入密码',
                          prefixIcon: Icon(Icons.remove_red_eye)),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: _passwordController,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Flex(
                direction: Axis.horizontal,
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
                                  labelText: '用户名',
                                  hintText: '请输入用户名',
                                  icon: Icon(Icons.perm_contact_calendar)),
                              validator: (val) {
                                if (val.trim().length < 6) {
                                  return '请输入6位以上的用户名';
                                }
                                return val.trim().length > 0 ? null : '请输入用户名！';
                              },
                            ),
                            RaisedButton(
                              child: Text('提交'),
                              onPressed: () {
                                if ((_formKey.currentState as FormState)
                                    .validate()) {
                                  print('提交数据给后台');
                                  print(_userNameController.text);
                                }
                              },
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 15,
                      top:30,
                      child: Container(
                          height: 50,
                          width: 50,
                          color:Colors.teal
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

// 定义具有State的Class.
class MyDropDownButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyDropDownButton(); // return的是具体的实现类
  }
}

// 实现具有State的类
class _MyDropDownButton extends State<MyDropDownButton> {
  List getCityList() {
//    <>中代表的是元素类型.
    List<DropdownMenuItem> cityList = new List();
    cityList.add(DropdownMenuItem(
      child: new Text('上海'),
      value: 'shanghai',
    ));
    cityList.add(DropdownMenuItem(
      child: new Text('北京'),
      value: 'beijing',
    ));
    cityList.add(DropdownMenuItem(
      child: new Text('广州'),
      value: 'guangzhou',
    ));
    cityList.add(DropdownMenuItem(
      child: new Text('深圳'),
      value: 'shenzhen',
    ));
    return cityList;
  }

  var selectedCity;
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new DropdownButton(
          items: getCityList(),
          hint: new Text('请选择城市'),
          value: selectedCity, // 需要赋值
          onChanged: (val) {
            print('val:$val');
            // setState存到变量中并刷新页面
            setState(() {
              this.selectedCity = val;
            });
          },
        )
      ],
    );
  }
}

class SwitchAndCheckBoxComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchAndCheckBoxComponent();
  }
}

class _SwitchAndCheckBoxComponent extends State<SwitchAndCheckBoxComponent> {
  var _switchValue = false;
  var _checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return new Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Switch(
            value: _switchValue,
            onChanged: (val) {
              setState(() {
                this._switchValue = val;
                print(this._switchValue.toString());
              });
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Checkbox(
            value: _checkboxValue,
            onChanged: (val) {
              setState(() {
                this._checkboxValue = val;
                print(this._checkboxValue.toString());
              });
            },
          ),
        )
      ],
    );
  }
}
