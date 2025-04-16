
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchCheckboxComponent extends StatefulWidget {
  @override
  _SwitchCheckboxComponentState createState() => _SwitchCheckboxComponentState();
}

class _SwitchCheckboxComponentState extends State<SwitchCheckboxComponent> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true;//维护复选框状态
  bool? _checkboxTriSelected = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Switch(
          value: _switchSelected,//当前状态
          onChanged:(value){
            //重新构建页面
            setState(() {
              _switchSelected=value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged:(value){
            setState(() {
              if (value != null) {
                _checkboxSelected = value;
              }
            });
          },
        ),
        Checkbox(
          tristate: true,
          value: _checkboxTriSelected,
          onChanged: (value){
            setState(() {
              _checkboxTriSelected = value;
            });
          }
        ),
      ],
    );
  }
}
