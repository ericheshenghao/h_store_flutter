

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DocDetail extends StatefulWidget {

  var ele;

  DocDetail(ele){
    this.ele = ele;
  }

  // var dio = Dio();
  //
  //
  // var response = await dio.post('http:192.168.1.109:3002docfindPage',data: {'params': {"type": "doc"}});
  //
  // List<dynamic> list = response.data["datas"]["records"];


  @override
  _DocDetailState createState() => _DocDetailState(ele);

}

class _DocDetailState extends State<DocDetail> {
  var ele;
  _DocDetailState(ele);





  @override
  Widget build(BuildContext context) {
    return
     Container(
       constraints: BoxConstraints.expand(
         height: Theme.of(context).textTheme.headline4.fontSize * 1.1 + 200.0,
       ),
       padding: const EdgeInsets.all(8.0),
       color: Colors.blue[600],
       alignment: Alignment.center,
       child: Text(ele["alias"],
         style: Theme.of(context)
             .textTheme
             .headline4
             .copyWith(color: Colors.white)),
       transform: Matrix4.rotationZ(0.1),
     );
  }
}
