
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LayoutHomeState();
}
class _LayoutHomeState extends State<LayoutHome> {

  List<String> widgetTitleList = [
    "sizeBox & constrainedBox",
    "constrainedBox",
    "rowDisplayWidget",
    "hFlexWidget",
    "vFlexWidget",
    "wrapWidget",
    "stackPostionWidget",
    "alignCenterWidget",
  ];

  late List<Widget> widgetList = [
    Row(
      children: [
        sizedBox,
        SizedBox(width: 8),
        unconstrainedBox,
      ],
    ),
    constrainedBox,
    rowDisplayWidget,
    hFlexWidget,
    vFlexWidget,
    wrapWidget,
    stackPostionWidget,
    alignWidget,
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LayoutHome"),
      ),
      body: Column(
        children: [
          Wrap(
            spacing: 8,
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

  final List<Widget> layoutBuilderChildren = [];
  // LayoutBuilder根据设备尺寸大小来布局
  late Widget layoutBuilderWidget = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          // 最大宽度小于200，显示单列
          return Column(children: layoutBuilderChildren, mainAxisSize: MainAxisSize.min);
        } else {
          // 大于200，显示双列
          var _children = <Widget>[];
          for (var i = 0; i < layoutBuilderChildren.length; i += 2) {
            if (i + 1 < layoutBuilderChildren.length) {
              _children.add(Row(
                children: [layoutBuilderChildren[i], layoutBuilderChildren[i + 1]],
                mainAxisSize: MainAxisSize.min,
              ));
            } else {
              _children.add(layoutBuilderChildren[i]);
            }
          }
          return Column(children: _children, mainAxisSize: MainAxisSize.min);
        }
      }
  );

  // 简单的调整一个子元素在父元素中的位置,使用Align更简单
  // Alignment Widget会以矩形的中心点作为坐标原点，即Alignment(0.0, 0.0)
  // 实际偏移 = (Alignment.x * (parentWidth - childWidth) / 2 + (parentWidth - childWidth) / 2,
  //         Alignment.y * (parentHeight - childHeight) / 2 + (parentHeight - childHeight) / 2)
  // FractionalOffset 的坐标原点为矩形的左侧顶点
  // 实际偏移 = (FractionalOffse.x * (parentWidth - childWidth), FractionalOffse.y * (parentHeight - childHeight))
  Widget alignWidget = Wrap(
    spacing: 8,
    runSpacing: 8,
    children: [
      Container(
        height: 120.0,
        width: 120.0,
        color: Colors.blue.shade50,
        child: Align(
          alignment: Alignment.topRight,
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
      Container(
        height: 120.0,
        width: 120.0,
        color: Colors.blue[50],
        child: Align(
          alignment: FractionalOffset(0.2, 0.6),
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
      DecoratedBox(
        decoration: BoxDecoration(color: Colors.red),
        child: Center(
          child: Text("xxx"),
        ),
      ),
      DecoratedBox(
        decoration: BoxDecoration(color: Colors.red),
        child: Center(
          widthFactor: 1,
          heightFactor: 1,
          child: Text("xxx"),
        ),
      )
    ],
  );

  Widget stackPostionWidget = ConstrainedBox(
    constraints: BoxConstraints.tightFor(width: 400, height: 200),
    child: Stack(
      alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
      children: <Widget>[
        Container(
          child: Text("Hello world",style: TextStyle(color: Colors.white)),
          color: Colors.red,
        ),
        Positioned(
          left: 18.0,
          child: Text("I am Jack"),
        ),
        Positioned(
          top: 18.0,
          child: Text("Your friend"),
        )
      ],
    ),
  );

  Widget wrapWidget = const Wrap(
    direction: Axis.horizontal,
    spacing: 8.0, // 主轴(水平)方向间距
    runSpacing: 4.0, // 纵轴（垂直）方向间距
    alignment: WrapAlignment.center, //沿主轴方向居中
    children: <Widget>[
      Chip(
        avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
        label: Text('Hamilton'),
      ),
      Chip(
        avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
        label: Text('Lafayette'),
      ),
      Chip(
        avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
        label: Text('Mulligan'),
      ),
      Chip(
        avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
        label: Text('Laurens'),
      ),
    ],
  );

  Widget vFlexWidget = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: SizedBox(
      height: 60.0,
      //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              height: 30.0,
              color: Colors.red,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 30.0,
              color: Colors.green,
            ),
          ),
        ],
      ),
    ),
  );

  Widget hFlexWidget = Flex(
    direction: Axis.horizontal,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Expanded(
        flex: 1,
        child: Container(
          height: 30.0,
          color: Colors.red,
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          height: 50.0,
          color: Colors.green,
        ),
      ),
    ],
  );

  // textDirection：表示水平方向子组件的布局顺序(是从左往右还是从右往左)，
  // 默认为系统当前Locale环境的文本方向(如中文、英语都是从左往右，而阿拉伯语是从右往左)
  // mainAxisAlignment参考textDirection
  // crossAxisAlignment的参考系是verticalDirection
  Widget rowDisplayWidget = const Column(
    //测试Row对齐方式，排除Column默认居中对齐的干扰
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(" hello world "),
          Text(" I am Jack "),
        ],
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(" hello world "),
          Text(" I am Jack "),
        ],
      ),
      Row(
        // mainAxisAlignment的参考是textDirection
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Text(" hello world "),
          Text(" I am Jack "),
        ],
      ),
      Row(
        // crossAxisAlignment的参考系是verticalDirection
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.up,
        children: <Widget>[
          Text(" hello world ", style: TextStyle(fontSize: 30.0),),
          Text(" I am Jack "),
        ],
      ),
    ],
  );

  // UnconstrainedBox 虽然在其子组件布局时可以取消约束（子组件可以为无限大），
  // 但是 UnconstrainedBox 自身是受其父组件约束的，所以当 UnconstrainedBox 随着其子组件变大后，
  // 如果UnconstrainedBox 的大小超过它父组件约束时，也会导致溢出报错
  late Widget unconstrainedBox = ConstrainedBox(
      constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
      child: UnconstrainedBox( //“去除”父级限制
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
          child: redBox,
        ),
      )
  );

  // 等价
  // ConstrainedBox(
  // constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0),
  // child: redBox,
  // )
  late SizedBox sizedBox = SizedBox(
      width: 80.0,
      height: 80.0,
      child: redBox
  );

  late ConstrainedBox constrainedBox = ConstrainedBox(
    constraints: BoxConstraints(
        minWidth: double.infinity, //宽度尽可能大
        minHeight: 50.0 //最小高度为50像素
    ),
    child: Container(
      height: 5.0,
      child: redBox ,
    ),
  );

  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );
}