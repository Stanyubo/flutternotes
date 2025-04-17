

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class ContainerHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContainerHomeState();
}

class _ContainerHomeState extends State<ContainerHome> {

  List<String> widgetTitleList = [
    "paddingWidget",
    "decoratedBoxWidget",
    "transformWidget",
    "rotatedBoxWidget",
    "containerWidget",
    // "clipWidget",
    "fittedBoxWidget",
  ];

  late List<Widget> widgetList = [
    paddingWidget,
    decoratedBoxWidget,
    transformWidget,
    rotatedBoxWidget,
    containerWidget,
    // clipWidget,
    fittedBoxWidget,

  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Container Homepage"),
      ),
      body: Column(
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (int i = 0; i < widgetTitleList.length; ++i)
                OutlinedButton(
                    onPressed: () {
                      setState((){
                        currentIndex = i;
                      });
                    },
                    child: Text("${widgetTitleList[i]}")
                ),
            ],
          ),
          Text("\n\n   --------- 展示效果 -------\n\n"),
          widgetList[currentIndex],
        ],
      ),
    );
  }

  Widget fittedBoxWidget = Column(
    children: [
      Container(
        width: 50,
        height: 50,
        color: Colors.red,
        child: FittedBox(
          fit: BoxFit.none,
          // 子容器超过父容器大小
          child: Container(width: 60, height: 70, color: Colors.blue),
        ),
      ),
      Text('Wendux'),
      Container(
        width: 50,
        height: 50,
        color: Colors.red,
        child: FittedBox(
          fit: BoxFit.contain,
          // 子容器超过父容器大小
          child: Container(width: 60, height: 70, color: Colors.blue),
        ),
      ),
      Text('Flutter中国'),
    ],
  );

  Widget containerWidget = Container(
    margin: EdgeInsets.only(top: 50.0, left: 120.0),
    constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),//卡片大小
    decoration: BoxDecoration(  //背景装饰
      gradient: RadialGradient( //背景径向渐变
        colors: [Colors.red, Colors.orange],
        center: Alignment.topLeft,
        radius: .98,
      ),
      boxShadow: [
        //卡片阴影
        BoxShadow(
          color: Colors.black54,
          offset: Offset(2.0, 2.0),
          blurRadius: 4.0,
        )
      ],
    ),
    transform: Matrix4.rotationZ(.2),//卡片倾斜变换
    alignment: Alignment.center, //卡片内文字居中
    child: Text(
      //卡片文字
      "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
    ),
  );

  //RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换，
  // 但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小。
  Widget rotatedBoxWidget = Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 8
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          //将Transform.rotate换成RotatedBox
          child: RotatedBox(
            quarterTurns: 1, //旋转90度(1/4圈)
            child: Text("Hello world"),
          ),
        ),
        Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
      ],
    ),
  );

  Widget transformWidget = Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 8
    ),
    child: Wrap(
      spacing: 60,
      runSpacing: 80,
      children: [
        // 变换
        Container(
          color: Colors.black,
          child: Transform(
            alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
            transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.deepOrange,
              child: const Text('Apartment for rent!'),
            ),
          ),
        ),
        // 平移
        DecoratedBox(
          decoration:BoxDecoration(color: Colors.red),
          //默认原点为左上角，左移20像素，向上平移5像素
          child: Transform.translate(
            offset: Offset(-20.0, -5.0),
            child: Text("Hello world"),
          ),
        ),
        // 旋转
        DecoratedBox(
          decoration:BoxDecoration(color: Colors.red),
          child: Transform.rotate(
            //旋转90度
            angle:math.pi/2 ,
            child: Text("Hello world"),
          ),
        )
      ],
    ),
  );

  Widget decoratedBoxWidget =  DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors:[Colors.red,Colors.orange.shade700]), //背景渐变
          borderRadius: BorderRadius.circular(3.0), //3像素圆角
          boxShadow: [ //阴影
            BoxShadow(
                color:Colors.black54,
                offset: Offset(2.0,2.0),
                blurRadius: 4.0
            )
          ]
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
        child: Text("Login", style: TextStyle(color: Colors.white),),
      )
  );

  Widget paddingWidget = const Column(
    //显式指定对齐方式为左对齐，排除对齐干扰
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: const <Widget>[
      Padding(
        //左边添加8像素补白
        padding: EdgeInsets.only(left: 8),
        child: Text("Hello world"),
      ),
      Padding(
        //上下各添加8像素补白
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text("I am Jack"),
      ),
      Padding(
        // 分别指定四个方向的补白
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Text("Your friend"),
      )
    ],
  );
}
