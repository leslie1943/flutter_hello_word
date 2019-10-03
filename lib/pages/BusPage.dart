import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BusPage extends StatefulWidget {
  @override
  _BusPageState createState() => _BusPageState();
}

// SingleTickerProviderStateMixin 混合是为了使用controller.
class _BusPageState extends State<BusPage> with SingleTickerProviderStateMixin {
  List _tabs = ['金杯', '奔驰', '丰田'];
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.amber,
          child: TabBar(
            controller: _controller,
            tabs: _tabs.map((t) => Tab(text: t)).toList(),
          ),
        ),
        Container(
          height: 400,
          child: TabBarView(
            controller: _controller,
            children: _tabs
                .map((t) => Container(
                      child: Text('$t内容'),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
