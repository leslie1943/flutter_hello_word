// Flutter code sample for

// This sample shows an [AppBar] with two simple actions. The first action
// opens a [SnackBar], while the second action navigates to a new page.

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
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Welcome page'),
        centerTitle: true,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
            }
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              open2ndPage(context);
            },
          ),
        ],
      ),
      body: Column(children: <Widget>[
        RaisedButton(
          child: Text('Raised button'),
          onPressed: () => {print('Raised button pressed!!')},
        ),
        FlatButton(
          child: Text('Flat button'),
          onPressed: () => {print('Flat button pressed!!')},
        ),
        OutlineButton(
          child: Text('Outline Button'),
          onPressed: () => {print('Outline button pressed!!')},
        ),
        FlatButton(
          child: Text('Flat customer button'),
          color: Colors.black,
          textColor: Colors.lightBlue,
          highlightColor: Colors.yellow,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          onPressed: () => {print('Flat customer button pressed!!')},
        ),
        BackButton(
//          child: Text('Flat customer button'),
//          onPressed: () => {print('Flat customer button pressed!!')},
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Category')),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), title: Text('AccessTime')),
        ],
        fixedColor: Colors.lightBlue,
      ),
    );
  }
}
