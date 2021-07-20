import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new ParentWidgetC(),
    );
  }
}


class ParentWidgetC extends StatefulWidget {

  @override
  _ParentWidgetCState createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: new TapboxC(
        active:_active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
}

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => new  _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {

  bool _highlight = false;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handlerTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? "Active":"Inactive",style: new TextStyle(fontSize: 32.0,color: Colors.white),),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700]:Colors.grey[600],
          border: _highlight ? new Border.all(
            color: Colors.teal[700],
            width: 10.0
          ) : null
        ),
      ),
    );
  }

  void  _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void  _handlerTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  void  _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }
}

