import 'package:flutter/material.dart';
import 'package:flutter_hello_word/biz/HospitalList.dart';
import 'package:flutter_hello_word/biz/AuthList.dart';
import 'package:flutter_hello_word/biz/SupplierList.dart';
import 'package:flutter_hello_word/biz/ServiceFee.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <Widget> pages = List<Widget>();
  int _currentIndex  = 0;
  @override
  void initState() {
    super.initState();
    pages.add(HospitalList());
    pages.add(SupplierList());
    pages.add(ServiceFee());
    pages.add(AuthList());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: new Container(
        child: pages[_currentIndex]
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              activeIcon: new Icon(Icons.account_box, color: Colors.white),
              icon: new Icon(Icons.account_box, color: Colors.blueGrey),
              title: Text('医院列表'),
              backgroundColor: Colors.blue),
          new BottomNavigationBarItem(
              activeIcon: new Icon(Icons.local_hospital, color: Colors.white),
              icon: new Icon(Icons.local_hospital, color: Colors.blueGrey),
              title: Text('供方管理'),
              backgroundColor: Colors.blue),
          new BottomNavigationBarItem(
              activeIcon: new Icon(Icons.attach_money, color: Colors.white),
              icon: new Icon(Icons.attach_money,color: Colors.blueGrey),
              title: Text('收费管理'),
              backgroundColor: Colors.blue),
          new BottomNavigationBarItem(
              activeIcon: new Icon(Icons.apps, color: Colors.white),
              icon: new Icon(Icons.apps,color: Colors.blueGrey),
              title: Text('权限管理'),
              backgroundColor: Colors.blue),
        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex =index;
          });
        },
      ),
    );
  }
}
