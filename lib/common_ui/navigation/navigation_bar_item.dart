import 'package:flutter/material.dart';

///底部导航栏按钮
class NavigationBarItem extends StatefulWidget {
  const NavigationBarItem({super.key, required this.builder});

  final WidgetBuilder builder;

  @override
  State createState() => _NavigationBarItemState();
}

class _NavigationBarItemState extends State<NavigationBarItem> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    controller.forward();
    animation = Tween<double>(begin: 0.8, end: 1).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: animation, child: widget.builder(context));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
