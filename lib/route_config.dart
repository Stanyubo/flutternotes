
import 'package:flutter/cupertino.dart';

import 'my_homepage.dart';
import 'chapter11_file_network/file_network_home.dart';
import 'chapter2/flutter_home.dart';
import 'chapter2/route_management.dart';
import 'chapter2/state_management.dart';

import 'chapter3_basic_component/basic_component_home.dart';
import 'chapter4_layout_component/layout_home.dart';
import 'chapter5_container_component/container_home.dart';
import 'chapter6_scroll_component/scroll_home.dart';
import 'chapter7_function_component/functional_widget_home.dart';

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
  "chapter7_function_component": (context) => FunctionalWidgetHome(),
  "chapter11_file_network": (context) => FileNetworkHome(),
};