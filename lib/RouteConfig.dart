
import 'package:flutter/cupertino.dart';

import 'MyHomePage.dart';

import 'chapter2/FlutterHome.dart';
import 'chapter2/RouteManagement.dart';
import 'chapter2/StateManagement.dart';

import 'chapter3_basic_component/BasicComponentHome.dart';

Map<String, WidgetBuilder> routeConfig = {
  "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),

  "chapter2_flutter_home": (context) => FlutterHome(),
  "chapter2_parent_widget": (context) => ParentWidget(),
  "chapter2_new_page": (context) => NewPage(text: "参数1"),
  "chapter2_echo_route": (context) => EchoRoute(),

  "chapter3_basic_component_home": (context) => BasicComponentHome(),

};