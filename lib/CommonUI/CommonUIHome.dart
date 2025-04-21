

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatefulWidget {

  final List<String> widgetTitleList;
  int currentIndex;

  TitleWidget({
    required this.widgetTitleList,
    required this.currentIndex
  });

  @override
  State<StatefulWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (int i = 0; i < widget.widgetTitleList.length; ++i)
          OutlinedButton(
              onPressed: () {
                setState(() {
                  widget.currentIndex = i;
                });
              },
              child: Text("${widget.widgetTitleList[i]}")
          ),
      ],
    );
  }
}

class DisplayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("\n\n   --------- 展示效果 -------\n\n");
  }
}