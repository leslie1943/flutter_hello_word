import 'package:flutter/material.dart';
import 'package:flutter_hello_word/biz/AnotherPage.dart';

void main() {
  runApp(MaterialApp(
    title: '页面跳转返回数据',
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: RouteButton(),
      ),
    );
  }
}

class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateToAnotherPage(context);
      },
      child: Text('Test to another page'),
    );
  }
  // Click event
  _navigateToAnotherPage(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AnotherPage()));

    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }
}
