

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_notes/chapter3_basic_component/switch_checkbox_component.dart';

import 'textfield_component.dart';

@immutable
class BasicComponentHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Component Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TextFieldComponent()
                      )
                  );
                },
                child: Text("Go to TextFieldComponent")
            ),

            Text("\n----- Text ------\n"),
            ...normalTextList,
            ...richTextList,
            defaultTextStyle,
            Text("\n----- Button ------\n"),
            ...buttonList,
            imageWidgets,
            SwitchCheckboxComponent(),
            ...indicatorList,
          ],
        ),
      ),
    );
  }

  List<Widget> normalTextList = [
    Text("Hello world! I'm Jack. "*4,
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
    Text("Hello world",
      textScaler: TextScaler.linear(3),
    ),
    Text("Hello world",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 18.0,
          height: 1.2,
          fontFamily: "Courier",
          background: Paint()..color=Colors.yellow,
          decoration:TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dashed
      ),
    ),
  ];

  List<Widget> richTextList = const [
    Text.rich(TextSpan(
        children: [
          TextSpan(
              text: "Home: "
          ),
          TextSpan(
            text: "https://flutterchina.club",
            style: TextStyle(
                color: Colors.blue
            ),
            // recognizer: _tapRecognizer
          ),
        ]
    ))
  ];

  DefaultTextStyle defaultTextStyle = const DefaultTextStyle(
    //1.设置文本默认样式
    style: TextStyle(
      color:Colors.red,
      fontSize: 20.0,
    ),
    textAlign: TextAlign.start,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("hello world"),
        Text("I am Jack"),
        Text("I am Jack",
          style: TextStyle(
              inherit: false, //2.不继承默认样式
              color: Colors.grey
          ),
        ),
      ],
    ),
  );

  List<Widget> buttonList = [

    Row(
      children: [
        ElevatedButton(
          child: Text("ElevatedButton"),
          onPressed: () {},
        ),
        TextButton(
          child: Text("TextButton"),
          onPressed: () {},
        ),
        OutlinedButton(
          child: Text("OutlinedButton"),
          onPressed: () {},
        ),

      ],
    ),

    Row(
      children: [
        IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: () {},
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.send),
          label: Text("发送"),
          onPressed: () {},
        ),
        OutlinedButton.icon(
          icon: Icon(Icons.add),
          label: Text("添加"),
          onPressed: () {},
        ),
        TextButton.icon(
          icon: Icon(Icons.info),
          label: Text("详情"),
          onPressed: () {},
        ),
      ],
    ),
  ];

  List<Widget> imageList = [
    Image(
      image: NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
      width: 50.0,
      fit: BoxFit.cover,
    ),
    Image(
      image: NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
      width: 50.0,
      fit: BoxFit.fitHeight,
    ),

    Text(
      "\uE03e" + " \uE237",
      style: TextStyle(
        fontFamily: "MaterialIcons",
        fontSize: 36.0,
        color: Colors.green,
      ),
    ),

    Text(
      "\uE287",
      style: TextStyle(
        fontFamily: "MaterialIcons",
        fontSize: 36.0,
        color: Colors.green,
      ),
    ),
  ];
  
  late Widget imageWidgets = Container(
    width: 300,
    height: 100,
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,  // 每行四个
        crossAxisSpacing: 10,  // 水平间距
        mainAxisSpacing: 10,  // 垂直间距
        childAspectRatio: 1,
      ),
      itemCount: this.imageList.length,
      itemBuilder: (context, index) {
        return this.imageList[index];
      },
    ),
  );

  List<TextField> textFieldList = [
    TextField(
      autofocus: true,
      decoration: InputDecoration(
          labelText: "用户名",
          hintText: "用户名或邮箱",
          prefixIcon: Icon(Icons.person)
      ),
    ),
    TextField(
      decoration: InputDecoration(
          labelText: "密码",
          hintText: "您的登录密码",
          prefixIcon: Icon(Icons.lock)
      ),
      obscureText: true,
    ),
  ];

  List<Widget> indicatorList = [
    SizedBox(
      height: 3,
      width: 300,
      child: LinearProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: AlwaysStoppedAnimation(Colors.blue),
      ),
    ),
    SizedBox(height: 8),
    SizedBox(
      height: 3,
      width: 300,
      child: LinearProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: AlwaysStoppedAnimation(Colors.blue),
        value: .5,
      ),
    ),
    SizedBox(height: 8),
    // 圆形进度条直径指定为100
    Wrap(
      spacing: 8,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        ),
        CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          value: .7,
        ),
        SizedBox(
          height: 40,
          width: 80,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .7,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8
          ),
          child:AnimationIndicator(),
        )
      ],
    )
  ];
}

class AnimationIndicator extends StatefulWidget {
  @override
  _AnimationIndicatorState createState() => _AnimationIndicatorState();
}

class _AnimationIndicatorState extends State<AnimationIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController = AnimationController(
      vsync: this, //注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
      duration: Duration(seconds: 3),
    );
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.grey[200],
      valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
          .animate(_animationController), // 从灰色变成蓝色
      value: _animationController.value,
    );
  }
}