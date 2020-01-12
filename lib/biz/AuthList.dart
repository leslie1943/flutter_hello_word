import 'package:flutter/material.dart';

class AuthList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('权限管理'),
        centerTitle: true,
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            RaisedButton(
              child: Text('返回'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: (){
                Navigator.pop(context,'go home');
              },
            )
          ],
        ),
      ),
    );
  }
}