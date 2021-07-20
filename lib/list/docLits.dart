import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';

import 'docDt.dart';

void main() {


  runApp(new ListState());
}

class ListState extends StatefulWidget {
  const ListState({ key}) : super(key: key);

  @override
  _ListStateState createState() => _ListStateState();
}

class _ListStateState extends State<ListState> {
  ListView view;

  @override
  void initState() {
    super.initState();

    _buildList();
  }

  void _buildList() async {
     var dio = Dio();


       var response = await dio.post('http://192.168.1.109:3002/doc/findPage',data: {'params': {"type": "doc"}});

      List<dynamic> list = response.data["datas"]["records"];


    var listView = ListView.builder(itemCount:10,itemBuilder: (BuildContext context, int index) {
      var ele = list.elementAt(index);
      return ListTile(title: Text(ele["title"]),
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => new DocDetail(ele),
            ),
          );
        },);
    });
    setState(() {
      this.view = listView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(

      home:  Scaffold(
          appBar: AppBar(title: const Text("_title")),
          body:   view,
          floatingActionButton:FlatButton.icon(
          icon: Icon(Icons.info),
          label: Text("详情"),

        ),
      ),
    );
  }


}


