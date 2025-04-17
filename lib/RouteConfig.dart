
import 'package:flutter/cupertino.dart';

import 'MyHomePage.dart';
import 'chapter2/FlutterHome.dart';
import 'chapter2/RouteManagement.dart';
import 'chapter2/StateManagement.dart';

import 'chapter3_basic_component/BasicComponentHome.dart';
import 'chapter4_layout_component/LayoutHome.dart';
import 'chapter5_container_component/ContainerHome.dart';
import 'chapter6_scroll_component/ScrollHome.dart';

Map<String, WidgetBuilder> routeConfig = {
  "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),

  "chapter2_flutter_home": (context) => FlutterHome(),
  "chapter2_parent_widget": (context) => ParentWidget(),
  "chapter2_new_page": (context) => NewPage(text: "参数1"),
  "chapter2_echo_route": (context) => EchoRoute(),

  "chapter3_basic_component_home": (context) => BasicComponentHome(),
  "chapter4_layout_home": (context) => LayoutHome(),
  "chapter5_container_home": (context) => ContainerHome(),
  "chapter6_scroll_homepage": (context) => ScrollHome(),
};