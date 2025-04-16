
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {

  final String text;

  const NewPage({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New Router"),
      ),
      body: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text("this is new route, 参数是：$text"),
            TextButton(
                onPressed: (){
                  Navigator.pop(context, '我是一个返回值');
                },
                child: Text('返回')
            )
          ],
      )
    );
  }
}

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("echo_page"),
      ),
      body: Column(
        children: [
          Text("new_page_echo_route param is: $args"),
        ],
      ),
    );
  }
}