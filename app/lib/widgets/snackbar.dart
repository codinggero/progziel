import 'package:flutter/material.dart';

class Snackbar {
  final BuildContext context;
  final Widget? child;
  final dynamic message;
  final Color? backgroundColor;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final ShapeBorder? shape;
  final SnackBarBehavior? behavior;
  final SnackBarAction? action;
  final double? actionOverflowThreshold;
  final bool? showCloseIcon;
  final Color? closeIconColor;
  final Duration duration;
  final Animation<double>? animation;
  final void Function()? onVisible;
  final DismissDirection dismissDirection;
  final Clip clipBehavior;

  Snackbar(
    this.context, {
    this.child,
    this.message,
    this.backgroundColor,
    this.elevation,
    this.margin,
    this.padding,
    this.width,
    this.shape,
    this.behavior,
    this.action,
    this.actionOverflowThreshold,
    this.showCloseIcon,
    this.closeIconColor,
    this.animation,
    this.onVisible,
    this.duration = const Duration(seconds: 5),
    this.dismissDirection = DismissDirection.down,
    this.clipBehavior = Clip.hardEdge,
  });

  void snackbar({Color? backgroundColor}) {
    final snackBar = SnackBar(
      content: child ?? Text('$message'),
      backgroundColor: backgroundColor,
      elevation: elevation,
      margin: margin,
      padding: padding,
      width: width,
      shape: shape,
      behavior: behavior,
      action: action,
      actionOverflowThreshold: actionOverflowThreshold,
      showCloseIcon: showCloseIcon,
      closeIconColor: closeIconColor,
      duration: duration,
      animation: animation,
      onVisible: onVisible,
      dismissDirection: dismissDirection,
      clipBehavior: clipBehavior,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void success({backgroundColor = const Color(0xFF2E7D32)}) {
    snackbar(backgroundColor: backgroundColor);
  }

  void information({backgroundColor = const Color(0xFF0288d1)}) {
    snackbar(backgroundColor: backgroundColor);
  }

  void warning({backgroundColor = const Color(0xFFED6C02)}) {
    snackbar(backgroundColor: backgroundColor);
  }

  void error({backgroundColor = const Color(0xFFD32F2F)}) {
    snackbar(backgroundColor: backgroundColor);
  }
}
