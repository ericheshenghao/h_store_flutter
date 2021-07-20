


import 'package:flutter/material.dart';


void main() => runApp(new RouteApp());


class RouteApp extends StatelessWidget {
  RouteApp();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: new AppPage(),
      // 注册路由表
        routes: {
          "new_page":(context) => newPage(text: "我是新页面"),
          "/":(context)=> AppPage(),
        },
      onGenerateRoute:(RouteSettings settings){
        return MaterialPageRoute(builder: (context){
          String routeName = settings.name;
          print(routeName);
            // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其它情况则正常打开路由。

        }
        );
      }
    );
  }
}

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () async {
                    // 打开`TipRoute`，并等待返回结果
                    var result = await Navigator.pushNamed(context, "new_page", arguments: "new_page");
                    //输出`TipRoute`路由返回结果
                    print("路由返回值: $result");
                  },
                  child: Text("打开提示页"),
                ),
              ],
            )
        )
    );
  }
}

class newPage extends StatelessWidget {

  newPage({Key key,@required this.text,}):super(key:key);
 final String text;

  @override
  Widget build(BuildContext context) {

    var args=ModalRoute.of(context).settings.arguments;
    print(args);

    return Scaffold(
      appBar: AppBar(title: Text("提示"),),
      body: Padding(padding: EdgeInsets.all(18),
      child: Center(
        child: Column(
          children: [
            Text(text),
            RaisedButton(onPressed: ()=>Navigator.pop(context,"我是返回值"),
            child: Text("返回"),)
          ],
        ),
      ),
      ),
    );
  }
}
