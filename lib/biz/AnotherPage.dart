import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('The another page'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Go back'),
                color: Colors.amberAccent,
                onPressed: () {
                  Navigator.pop(context, 'go back');
                },
              ),
              RaisedButton(
                child: Text('Go home'),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pop(context, 'go home');
                },
              )
            ],
          ),
        ));
  }
}
