

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  FocusNode passwordFocusNode = FocusNode();

  FocusScopeNode? focusScopeNode;

  String? password = "666888";

  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController(text: password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextFieldComponent"),
      ),
      body: Column(
        children: [
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)
            ),
            onChanged: (value) {
              // 获取新值
            },
          ),
          TextField(
            focusNode: passwordFocusNode,
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock)
            ),
            onChanged: (val) {
              password = val;
            },
            obscureText: true,
            controller: _passwordController,
          ),
          Text(" \n\n\n ----- FormTextFieldComponent ---- \n"),
          FormTextFieldComponent(),
        ],
      ),
    );
  }
}

class FormTextFieldComponent extends StatefulWidget {
  @override
  _FormTextFieldComponentState createState() => _FormTextFieldComponentState();
}

class _FormTextFieldComponentState extends State<FormTextFieldComponent> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  late List<Widget> widgetList = [
    TextFormField(
      autofocus: true,
      controller: _unameController,
      decoration: InputDecoration(
        labelText: "用户名",
        hintText: "用户名或邮箱",
        icon: Icon(Icons.person),
      ),
      // 校验用户名
      validator: (v) {
        return v!.trim().isNotEmpty ? null : "用户名不能为空";
      },
    ),
    TextFormField(
      controller: _pwdController,
      decoration: InputDecoration(
        labelText: "密码",
        hintText: "您的登录密码",
        icon: Icon(Icons.lock),
      ),
      obscureText: true,
      //校验密码
      validator: (v) {
        return v!.trim().length > 5 ? null : "密码不能少于6位";
      },
    ),
  ];

  late Widget loginWidget = Padding(
    padding: const EdgeInsets.only(top: 28.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("登录"),
            ),
            onPressed: () {
              // 通过_formKey.currentState 获取FormState后，
              // 调用validate()方法校验用户名密码是否合法，校验
              // 通过后再提交数据。
              if ((_formKey.currentState as FormState).validate()) {
                //验证通过提交数据
              }
            },
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          ...widgetList,
          // 登录按钮
          loginWidget,
        ],
      ),
    );
  }
}