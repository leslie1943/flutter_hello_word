import 'package:flutter/material.dart';

class ServiceFee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('收费管理'),
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
