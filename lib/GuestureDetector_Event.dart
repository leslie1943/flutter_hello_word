// Flutter code sample for

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyIcon.dart';
import 'dart:math' as math;
import 'pages/BusPage.dart';
import 'pages/PlanePage.dart';
import 'pages/MyPage.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStateWidget(),
    );
  }
}

class MyStateWidget extends StatefulWidget {
  @override
  _MyStateWidget createState() => _MyStateWidget();
}

class _MyStateWidget extends State<MyStateWidget> {
  int currentIndex = 0;
  List<StatefulWidget> pageList = [BusPage(), PlanePage(), MyPage()];
  GlobalKey<ScaffoldState> _globalKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key:_globalKey, // 这是Scaffold的别名
        appBar: AppBar(
          // leading是最左边按钮
          leading: IconButton(icon: Icon(Icons.dashboard),onPressed: (){
            _globalKey.currentState.openDrawer();
          },),
          title: Text('Hello Leslie.'),
          actions: <Widget>[
            IconButton(
              icon: Icon(MyIcon.huawei),
              onPressed: () {
                print('press hua wei.');
              },
            )
          ],
        ),

        body: GestureDetector(
          child: Container(
            width: 200,
            height: 200,
            color:Colors.blue,
          ),
          onTap: (){
            print('on tap');
          },
          onDoubleTap: (){
            print('on double tap');
          },
          onLongPress: (){
            print('on long press.');
          },
          onHorizontalDragStart: (e){
            print('on horizontal drag start');
          },
          onScaleUpdate: (e){
            print('on scale update.');
          },
        )

    );
  }
}
