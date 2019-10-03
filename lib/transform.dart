// Flutter code sample for

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyIcon.dart';
import 'dart:math' as math;

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

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: <Widget>[
//            Container(
//              color: Colors.cyan,
//              child: Transform(
//                transform: new Matrix4.skewY(0.5), // 对Y轴进行变换.
//                child: Container(
//                  color: Colors.amberAccent,
//                  child: Text('Skew y'),
//                ),
//              ),
//            ),
//            Container(
//              color: Colors.cyan,
//              child: Transform(
//                transform: new Matrix4.skewX(0.5), // 对Y轴进行变换.
//                child: Container(
//                  color: Colors.amberAccent,
//                  child: Text('Skew x'),
//                ),
//              ),
//            )
//            Container(
//              color: Colors.cyan,
//              child: Transform.scale( // 放大后显示大小不变.只是内容放大.
//                scale: 10.0,
//                child: Container(
//                  color: Colors.amberAccent,
//                  child: Text('Skew x'),
//                ),
//              ),
//            )
//            Container(
//              color: Colors.cyan,
//              width: 300,
//              height: 300,
//              child: Transform.rotate( // 旋转
//                angle: math.pi * 3 / 4,
//                child: Container(
//                  color: Colors.amberAccent,
//                  child: Text('Skew x'),
//                ),
//              ),
//            )
            Container(
              color: Colors.cyan,
              width: 300,
              height: 300,
              child: Transform.translate(
                offset: Offset(200,50),
                child: Container(
                  color: Colors.amberAccent,
                  child: Text('Skew x'),
                ),
              ),
            )
          ],
        ));
  }
}
