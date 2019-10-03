// Flutter code sample for

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    // define common style
    const styles = TextStyle(
        // 0x表示16进制
        // ff表示透明度
        color: const Color(0xff5aaafa), //Colors.blueAccent,
        fontSize: 20,
        fontFamily: 'YaHei',
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.dashed);
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
        body: Wrap(
          spacing: 25,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              color: Colors.pink,
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.greenAccent,
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.blue,
            )
          ],
        ));
  }
}
