import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p/CommonUI/CommonUIHome.dart';

import 'file_operation_route.dart';

class FileNetworkHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FileNetworkHomeState();
}

class _FileNetworkHomeState extends State<FileNetworkHome> {

  List<String> widgetTitleList = [
    "toFileOperationRoute",

  ];
  int currentIndex = 0;
  late List<Function> funcList = [
    _toFileOperationRoute,
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("FileNetworkHome"),
      ),
      body: Column(
        children: [
          TitleWidget(widgetTitleList: widgetTitleList, currentIndex: currentIndex),
          DisplayWidget(),
          if (widgetTitleList.length > 0)
            funcList[currentIndex](),

        ],
      ),
    );
  }

  Widget _toFileOperationRoute() {
    return OutlinedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FileOperationRoute()));
        },
        child: Text("FileOperationRoute")
    );
  }
}