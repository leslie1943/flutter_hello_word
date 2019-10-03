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
        body: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                'Hello body, ',
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1.4,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Style test',
                style: styles,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Start section',
                    style: TextStyle(
                        color: Colors.deepOrangeAccent, fontSize: 24)),
                TextSpan(
                    text: 'Middle section',
                    style: TextStyle(color: Colors.cyan, fontSize: 20)),
                TextSpan(
                    text: 'End section',
                    style: TextStyle(color: Colors.black26))
              ])),
            ),
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
          ],
        ));
  }
}
