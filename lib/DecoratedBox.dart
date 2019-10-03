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
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.amberAccent, Colors.cyan]),
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
          boxShadow: [
            BoxShadow(color: Colors.amberAccent, offset: Offset(3, 3),blurRadius: 14.0)
          ],),
        child: FlatButton( // 上面是修饰区域，这里是内容
          onPressed: null,
          child: Text('Text button'),
        ),
      ),
    );
  }
}
