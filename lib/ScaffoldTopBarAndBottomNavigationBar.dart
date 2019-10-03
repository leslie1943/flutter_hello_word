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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.airport_shuttle), title: Text('bus')),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplanemode_active), title: Text('plane')),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_run), title: Text('My'))
        ],
        currentIndex: this.currentIndex,
        onTap: (index) {
          setState(() {
            // setState 改变状态并刷新状态
            this.currentIndex = index;
          });
        },
      ),
      body: this.pageList[this.currentIndex],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('you clicked the +');
        },
      ),
    );
  }
}
