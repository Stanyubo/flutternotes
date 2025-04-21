
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventNotificationHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EventNotificationHomeState();
}

class _EventNotificationHomeState extends State<EventNotificationHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EventNotificationHome"),
      ),
      body: Column(
        children: [
          Text("在家看完，环境没有搭好，就没写笔记了"),
        ],
      ),
    );
  }
}