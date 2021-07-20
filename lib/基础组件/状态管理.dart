import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new TapboxA(),
    );
  }
}


class TapboxA extends StatefulWidget {
  const TapboxA({ key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;


  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active? "Active":"Inactive",
            style: new TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] :Colors.grey[600],
        ),
      ),
    );
  }

  void _handleTap() {
    setState(() {
      _active = ! _active;
    });
  }
}
