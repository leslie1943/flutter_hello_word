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
        body: SizedBox(
          height: 400,
          width: 400,
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Positioned(
//                left: 15,
//                top: 30,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.teal,
                ),
              ),
              Positioned(
                right: 100,
//                top: 30,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.orange,
                ),
              ),
              Positioned(
                right: 200,
//                top: 30,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              Positioned(
                right: 300,
//                top: 30,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.amberAccent,
                ),
              ),
              Positioned(
//                left: 100,
                  top: 100,
                  child:Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                  )
              ),
              Positioned(
                  right: 200,
                  top: 100,
                  child:Container(
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  )
              ),
              Positioned(
//                  right: 100,
                  top: 300,
                  child:Container(
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                  )
              ),
              Positioned(
                  right: 100,
                  top: 300,
                  child:Container(
                    height: 100,
                    width: 100,
                    color: Colors.brown,
                  )
              ),
              Positioned(
                  right: 200,
                  top: 300,
                  child:Container(
                    height: 100,
                    width: 100,
                    color: Colors.greenAccent,
                  )
              ),
              Positioned(
                  right: 300,
                  top: 300,
                  child:Container(
                    height: 100,
                    width: 100,
                    color: Colors.pinkAccent,
                  )
              )
            ],
          )
        ));
  }
}
