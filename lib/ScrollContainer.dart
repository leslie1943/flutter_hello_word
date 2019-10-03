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
        leading:
        new IconButton(icon: new Icon(Icons.arrow_back), onPressed: () {}),
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
//        body:Scrollbar(
//          child: SingleChildScrollView(
//            child: Container(
//              height: 3000,
//              color: Colors.cyan,
//            ),
//          ),
//        )
      body: Column(
        children: <Widget>[
          ListTile(title: Text('固定的表头')),
          Container(
              height: 400,
              child: ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: 50,
                  itemExtent: 50,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.cyan,
                      child: Text('列表内容$index'),
                    );
                  }))
        ],
      ),
//      body: GridView(
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 3, // 每一行的个数
//          childAspectRatio: 1,
//        ),
//        children: <Widget>[
//          Text('1'),
//          Text('2'),
//          Text('3'),
//          Text('4'),
//          Text('5'),
//          Text('6'),
//          Text('7'),
//          Text('8'),
//          Text('9'),
//        ],
//      ),
    );
  }
}
