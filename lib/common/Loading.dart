import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading {
  final BuildContext _context;
  Loading(this._context);

  // open loading
  void show() {
    showDialog(
        context: _context,
        builder: (context) {
          return SpinKitCircle(color: Colors.white);
        }).then((value) {
    });
  }

  void close(){
    Navigator.of(_context).pop();
  }
}
