
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_notes/common_ui/custom_provider.dart';

class Item {
  Item(this.price, this.count);
  double price; //商品单价
  int count; // 商品份数
//... 省略其他属性
}

class CartModel extends CustomChangeNotifier {
  // 用于保存购物车中商品列表
  final List<Item> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // 购物车中商品的总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  // 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add(Item item) {
    _items.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
}

// CartModel即要跨组件共享的model类。最后我们构建示例页面：
class ProviderRouteDisplay extends StatefulWidget {
  @override
  _ProviderRouteDisplayState createState() => _ProviderRouteDisplayState();
}

class _ProviderRouteDisplayState extends State<ProviderRouteDisplay> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<CartModel>(
        data: CartModel(),
        child: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              Builder(builder: (context){
                return Consumer<CartModel>(
                    builder: (context, cart)=> Text("总价: ${cart?.totalPrice}")
                );
              }),
              Builder(builder: (context){
                print("ElevatedButton build"); //在后面优化部分会用到
                return ElevatedButton(
                  child: Text("添加商品"),
                  onPressed: () {
                    //给购物车中添加商品，添加后总价会更新
                    // ChangeNotifierProvider.of<CartModel>(context).add(Item(20.0, 1));

                    // listen 设为false，不建立依赖关系
                    ChangeNotifierProvider.of<CartModel>(context, listen: false)
                        .add(Item(20.0, 1));
                  },
                );
              }),
            ],
          );
        }),
      ),
    );
  }
}