
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

// 加载文本assets
Future<String> loadAsset() async {
  return await rootBundle.loadString('asset/config.json');
}

// 加载图片
Widget build(BuildContext context) {
  return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          // AssetImage 并非是一个widget， 它实际上是一个ImageProvider
          image: AssetImage('assets/images/**.png'),
        )
      )
  );
}

// 显示图片的Widget
Widget buildWidget(BuildContext context) {
  return Image.asset('graphics/background.png');
}

