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
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(bottom: 20),
              height: 200,
              width: 300,
              color: Colors.cyan,
              child: Text('this is container 1'),
            ),
            Container(
              alignment: Alignment.centerRight,
//              margin: EdgeInsets.all(20),
              margin: EdgeInsets.only(top: 20),
              height: 200,
              width: 300,
              color: Colors.green,
              child: Text('this is container 2'),
            ),
            Container(
              padding: EdgeInsets.all(50),
//              margin: EdgeInsets.all(20),
              color: Colors.amberAccent,
              child: Text('this is container 3'), // 没有width 和 height, 大小由内容和内边距决定.
            )
          ],
        ));
  }
}
