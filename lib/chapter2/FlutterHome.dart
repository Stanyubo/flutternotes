import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// todo: 平台共享assets如何实现
// todo: DevTools使用
// todo: Flutter异常捕获

class FlutterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterHomePage")
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "chapter2_parent_widget");
              },
              child: Text("chapter2_parent_widget")
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "echo_page", arguments: "echo_page_param");
              },
              child: Text("chapter2_echo_page")
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "chapter2_echo_route");
              },
              child: Text("chapter2_echo_route")
          ),
        ],
      ),
    );
  }
}