
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_notes/common_ui/common_ui_home.dart';
import 'package:flutter_notes/chapter6_scroll_component/tabbar_display_page.dart';

import '../common_ui/keep_alive_wrapper.dart';
import 'nested_scrollview_display.dart';

// Flutter滚动组件主要由三个角色组成：Scrollable、Viewport 和 Sliver
//通常SingleChildScrollView只应在期望的内容不会超过屏幕太多时使用
// todo: 了解SliverPersistentHeaderDelegate、SliverFlexibleHeader、SliverPersistentHeaderToBox

class ScrollHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScrollHomeState();
}

class _ScrollHomeState extends State<ScrollHome> {

  List<String> widgetTitleList = [
    "singleChildScrollViewWidget",
    "listViewWidget",
    "scrollNotificationListWidget",
    "gridViewWidget",
    "pageViewWidget",
    "tabBarViewWidgets",
    "customScrollViewDisplay1",
    "nestedScrollViewDisplay"

  ];

  late List<Function> funcList = [
    _singleChildScrollViewWidget,
    _listViewWidget,
    _scrollNotificationListWidget,
    _gridViewWidget,
    _pageViewWidget,
    _tabBarViewWidgets,
    _customScrollViewDisplay1,
    _nestedScrollViewDisplay,
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollHome"),
      ),
      body: Column(
        children: [
          TitleWidget(widgetTitleList: widgetTitleList, currentIndex: currentIndex),
          DisplayWidget(),
          funcList[currentIndex](),
        ],
      ),
    );
  }


  Widget _nestedScrollViewDisplay() {
    return OutlinedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NestedScrollViewDisplay()));
        },
        child: Text("go to NestedScrollViewDisplay")
    );
  }

  // SliverToBoxAdapter 组件，它是一个适配器：可以将 RenderBox 适配为 Sliver
  Widget _customScrollViewDisplay1() {
    // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
    // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
    // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
    var listView = SliverFixedExtentList(
      itemExtent: 36, //列表项高度固定
      delegate: SliverChildBuilderDelegate(
            (_, index) => ListTile(title: Text('$index')),
        childCount: 10,
      ),
    );
    // 使用
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: CustomScrollView(
        slivers: [
          listView,
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: PageView(
                children: [Text("1", style: TextStyle(fontSize: 60)), Text("2", style: TextStyle(fontSize: 60))],
              ),
            ),
          ),
          listView,
        ],
      ),
    );
  }

  Widget _tabBarViewWidgets() {
    return OutlinedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TabBarDisplayPage()));
        },
        child: Text("go to TabBarDisplayPage")
    );
  }

  Widget _pageViewWidget() {
    List<String> stringList = ["1", "2", "3", "4", "5"];
    return KeepAliveWrapper(
        child: SizedBox(
          width: double.infinity,
          height: 400,
          child: PageView(
            children: [
              for(int i = 0; i < stringList.length; ++i)
                Text(stringList[i], style: TextStyle(fontSize: 60.0))
            ],
          ),
        )
    );
  }

  Widget _gridViewWidget() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 300,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //横轴三个子widget
                childAspectRatio: 1.0 //宽高比为1时，子widget
            ),
            children:<Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast)
            ]
          ),
        ),

        // 可用GridView.extent替代
        SizedBox(
          width: double.infinity,
          height: 100,
          child: GridView(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 80.0,
                childAspectRatio: 2.0 //宽高比为2
            ),
            children:<Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast)
            ]
          ),
        ),
      ],
    );
  }

  String _progress = "0%"; //保存进度百分比
  // todo:为什么在build中函数调用时_progress更新，而通过late 创建在数组中的widget不更新_progress的变化
  Widget _scrollNotificationListWidget() {
    return SizedBox(
      height: 400,
      child: Scrollbar(
        //进度条
        // 监听滚动通知
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            //重新构建
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            return false;
            //return true; //放开此行注释后，进度条将失效
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                itemBuilder: (context, index) => ListTile(title: Text("$index")),
              ),
              CircleAvatar(
                //显示进度百分比
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _listViewWidget() {
    Widget divider1 =  Divider(color: Colors.blue,);
    Widget divider2 =  Divider(color: Colors.green);
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: 200,
          ),
          child: ListView.builder(
              itemCount: 100,
              itemExtent: 50.0, //强制高度为50.0
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text("$index"));
              }
          ),
        ),
        Divider(color: Colors.yellow),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 100,
            maxHeight: 200,
          ),
          child: ListView.separated(
            itemCount: 100,
            //列表项构造器
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            },
            //分割器构造器
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 0 ? divider1 : divider2;
            },
          ),
        ),
      ],
    );
  }

  Widget _singleChildScrollViewWidget() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: double.infinity,
        maxHeight: 300,
      ),
      child: Scrollbar( // 显示进度条
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              //动态创建一个List<Widget>
              children: "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")
              //每一个字母都用一个Text显示,字体为原来的两倍
                  .map((c) => Text(c, textScaleFactor: 2.0,))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

}
