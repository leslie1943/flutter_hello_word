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
      decorationStyle: TextDecorationStyle.dashed
    );
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
      body: Column(children: <Widget>[
        Text('Hello body, my text align is center,Hello body,'
            'Hello body, my text align is center,Hello body,'
            'Hello body, my text align is center,Hello body,'
            'Hello body, my text align is center,Hello body,',
          textAlign: TextAlign.left,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1.4,
        ),
        Text('Style test',style: styles,),
        Text.rich(TextSpan(
          children: [
            TextSpan(text: 'Start section',style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 24
            )),
            TextSpan(text: 'Middle section',style: TextStyle(
              color:Colors.cyan,
              fontSize: 20
            )),
            TextSpan(text:'End section',style: TextStyle(
              color: Colors.black26
            ))
          ]
        ))
      ]),
    );
  }
}
