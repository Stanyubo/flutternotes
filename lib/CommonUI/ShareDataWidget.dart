
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
dependOnInheritedWidgetOfExactType比getElementForInheritedWidgetOfExactType多调用了dependOnInheritedElement方法

 在调用dependOnInheritedWidgetOfExactType()时，InheritedWidget和依赖它的子孙组件关系便完成了注册，
 之后当InheritedWidget发生变化时，就会更新依赖它的子孙组件，
 也就是会调这些子孙组件的didChangeDependencies()方法和build()方法

@override
InheritedWidget dependOnInheritedElement(InheritedElement ancestor, { Object aspect }) {
  assert(ancestor != null);
  _dependencies ??= HashSet<InheritedElement>();
  _dependencies.add(ancestor);
  ancestor.updateDependencies(this, aspect);
  return ancestor.widget;
}

didChangeDependencies()是否调用看widget的build方法是否有使用InheritedWidget中的数据
一般来说，子 widget 很少会重写此方法，因为在依赖改变后 Flutter 框架也都会调用build()方法重新构建组件树。
但是，如果你需要在依赖改变后执行一些昂贵的操作，比如网络请求，这时最好的方式就是在此方法中执行，
这样可以避免每次build()都执行这些昂贵操作。
 *
 */

class ShareDataWidget extends InheritedWidget {

  final int data;

  ShareDataWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  // 定义一个便捷方法，方便子树中的widget获取共享数据
  // 某个子widget使用示例：Text(ShareDataWidget.of(context)!.data.toString());
  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  //  该回调决定当data发生变化时，是否通知子树中依赖data的Widget重新build
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }

}
