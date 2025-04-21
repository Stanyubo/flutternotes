

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CommonUI/KeepAliveWrapper.dart';

class TabBarDisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List tabs = ["新闻", "历史", "图片"];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TabBarDisplayPage"),
          bottom: TabBar(
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: TabBarView( //构建
          children: tabs.map((e) {
            return KeepAliveWrapper(
              child: Container(
                alignment: Alignment.center,
                child: Text(e, style: TextStyle(fontSize: 60)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}