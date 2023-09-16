import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'index.dart';

class Indicator {
  static bool state = false;

  static Color hexColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  static Future call(
    BuildContext context,
    bool response, {
    bool barrierDismissible = false,
  }) async {
    if (response == true && state == false) {
      state = true;
      return showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) => Center(
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: CupertinoActivityIndicator(),
            ),
          ),
        ),
      );
    } else if (response == false && state == true) {
      state = false;
      Navigator.of(context).pop();
    }
  }

  static onStart(BuildContext context,
      {String hint = 'Processing', List<Widget>? actions}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            backgroundColor: Colors.white,
            content: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 16),
                Text(
                  hint,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText(
                      '...',
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.center,
                      speed: const Duration(milliseconds: 500),
                    ),
                  ],
                ),
              ],
            ),
            actions: actions,
          ),
        );
      },
    );
  }

  static onStop(BuildContext context) {
    Navigator.pop(context);
  }

  static onError(
    BuildContext context,
    dynamic error, {
    bool? pop = true,
    void Function()? onPressed,
    String label = 'Ok',
  }) {
    if (pop == true) Navigator.pop(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('$error'),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: (onPressed != null)
                    ? onPressed
                    : () => Navigator.pop(context),
                child: Text(label),
              ),
            ],
          ),
        );
      },
    );
  }

  static snackbar(
    BuildContext context, {
    Widget? content,
    dynamic message,
    Color? backgroundColor,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    ShapeBorder? shape,
    SnackBarBehavior? behavior,
    SnackBarAction? action,
    double? actionOverflowThreshold,
    bool? showCloseIcon,
    Color? closeIconColor,
    Duration duration = const Duration(seconds: 5),
    Animation<double>? animation,
    void Function()? onVisible,
    DismissDirection dismissDirection = DismissDirection.down,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    final snackBar = SnackBar(
      content: content ?? Text('$message'),
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
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static error(
    BuildContext context, {
    Widget? content,
    dynamic message,
    Color? backgroundColor,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    ShapeBorder? shape,
    SnackBarBehavior? behavior,
    SnackBarAction? action,
    double? actionOverflowThreshold,
    bool? showCloseIcon,
    Color? closeIconColor,
    Duration duration = const Duration(seconds: 5),
    Animation<double>? animation,
    void Function()? onVisible,
    DismissDirection dismissDirection = DismissDirection.down,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    snackbar(
      context,
      content: content,
      message: message,
      backgroundColor: hexColor('#d32f2f'),
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
  }

  static warning(
    BuildContext context, {
    Widget? content,
    dynamic message,
    Color? backgroundColor,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    ShapeBorder? shape,
    SnackBarBehavior? behavior,
    SnackBarAction? action,
    double? actionOverflowThreshold,
    bool? showCloseIcon,
    Color? closeIconColor,
    Duration duration = const Duration(seconds: 5),
    Animation<double>? animation,
    void Function()? onVisible,
    DismissDirection dismissDirection = DismissDirection.down,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    snackbar(
      context,
      content: content,
      message: message,
      backgroundColor: hexColor('#ed6c02'),
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
  }

  static information(
    BuildContext context, {
    Widget? content,
    dynamic message,
    Color? backgroundColor,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    ShapeBorder? shape,
    SnackBarBehavior? behavior,
    SnackBarAction? action,
    double? actionOverflowThreshold,
    bool? showCloseIcon,
    Color? closeIconColor,
    Duration duration = const Duration(seconds: 5),
    Animation<double>? animation,
    void Function()? onVisible,
    DismissDirection dismissDirection = DismissDirection.down,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    snackbar(
      context,
      content: content,
      message: message,
      backgroundColor: hexColor('#0288d1'),
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
  }

  static success(
    BuildContext context, {
    Widget? content,
    dynamic message,
    Color? backgroundColor,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    ShapeBorder? shape,
    SnackBarBehavior? behavior,
    SnackBarAction? action,
    double? actionOverflowThreshold,
    bool? showCloseIcon,
    Color? closeIconColor,
    Duration duration = const Duration(seconds: 5),
    Animation<double>? animation,
    void Function()? onVisible,
    DismissDirection dismissDirection = DismissDirection.down,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    snackbar(
      context,
      content: content,
      message: message,
      backgroundColor: hexColor('#2e7d32'),
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
  }
}
