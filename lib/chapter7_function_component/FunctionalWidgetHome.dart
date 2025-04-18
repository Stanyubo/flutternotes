import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../CommonUI/ShareDataWidget.dart';
import 'ProviderRouteDisplay.dart';

//  todo: 了解WillPopScope导航返回拦截

//  ValueListenableBuilder 有两点需要牢记：
//  1、和数据流向无关，可以实现任意流向的数据共享。
//  2、实践中，ValueListenableBuilder 的拆分粒度应该尽可能细，可以提高性能。

class FunctionalWidgetHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FunctionalWidgetHomeState();
}

class _FunctionalWidgetHomeState extends State<FunctionalWidgetHome> {

  List<String> widgetTitleList = [
    "providerRoute",
    "futureBuilderWidget",
    "streambuilder",

  ];

  late List<Function> funcList = [
    _providerRouteDisplayPage,
    _futureBuilderWidget,
    _streambuilder,
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> titleWidgets = _titleWidgets();
    return Scaffold(
      appBar: AppBar(
        title: Text("FunctionalWidgetHome"),
      ),
      body: Column(
        children: [
          ...titleWidgets,
          funcList[currentIndex](),
        ],
      ),
    );
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }

  Widget _streambuilder() {
    return StreamBuilder<int>(
      stream: _counter(), //
      //initialData: ,// a Stream<int> or null
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasError)
          return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('没有Stream');
          case ConnectionState.waiting:
            return Text('等待数据...');
          case ConnectionState.active:
            return Text('active: ${snapshot.data}');
          case ConnectionState.done:
            return Text('Stream 已关闭');
        }
      },
    );
  }

  Stream<int> _counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }

  Widget _futureBuilderWidget() {
    return Center(
      child: FutureBuilder<String>(
        future: _mockNetworkData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              return Text("Contents: ${snapshot.data}");
            }
          } else {
            // 请求未结束，显示loading
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
  Future<String> _mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }

  Widget _providerRouteDisplayPage() {
    return ProviderRouteDisplay();
  }

  List<Widget> _titleWidgets() {
    return [
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (int i = 0; i < widgetTitleList.length; ++i)
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    currentIndex = i;
                  });
                },
                child: Text("${widgetTitleList[i]}")
            ),
        ],
      ),
      Text("\n\n   --------- 展示效果 -------\n\n"),
    ];
  }

}