import 'package:flutter/material.dart';

import 'app.dart';

class Navigate {
  static Route _right(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, anaimation, anaimation2) => widget,
      transitionsBuilder: (context, anaimation, anaimation2, child) {
        var begin = const Offset(1, 0);
        var end = const Offset(0, 0);
        var tween = Tween(begin: begin, end: end);
        var carve = CurvedAnimation(
          parent: anaimation,
          curve: Curves.linearToEaseOut,
        );
        return SlideTransition(
          position: tween.animate(carve),
          child: child,
        );
      },
    );
  }

  static Route _left(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => widget,
      transitionsBuilder: (context, animation1, animation2, child) {
        var begin = const Offset(-1, 0);
        var end = const Offset(0, 0);
        var tween = Tween(begin: begin, end: end);
        var curved =
            CurvedAnimation(parent: animation1, curve: Curves.linearToEaseOut);
        return SlideTransition(
          position: tween.animate(curved),
          child: child,
        );
      },
    );
  }

  static Route _aligment(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => widget,
      transitionsBuilder: (context, animation1, animation2, child) {
        return Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: SizeTransition(
            sizeFactor: animation1,
            child: child,
          ),
        );
      },
    );
  }

  static void right(BuildContext context, Widget widget) {
    Navigator.of(context).push(_right(widget));
  }

  static void left(BuildContext context, Widget widget) {
    Navigator.of(context).push(_left(widget));
  }

  static void aligment(BuildContext context, Widget widget) {
    Navigator.of(context).push(_aligment(widget));
  }

  static void finsih(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );
  }

  static void popAndPushNamed(BuildContext context, String route,
      {Object? arguments}) {
    Navigator.of(context).popAndPushNamed(route, arguments: arguments);
  }

  static void pushNamed(BuildContext context, String route,
      {Object? arguments}) {
    Navigator.of(context).pushNamed(route, arguments: arguments);
  }
}

class Navigations extends StatelessWidget {
  final int index;
  final Function(int) onChange;
  final List<IconData> items;

  const Navigations({
    super.key,
    this.index = 0,
    required this.onChange,
    required this.items,
  });

  Widget widget(IconData? icon, int i) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: App.padding),
      child: IconButton(
        onPressed: () {
          onChange(i);
        },
        icon: Icon(
          icon,
          color: index == i ? App.green : App.dimGray,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (var i = 0; i < items.length; i++) {
      children.add(widget(items[i], i));
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: App.padding),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
