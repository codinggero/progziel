import 'package:flutter/material.dart';
import '/package.dart';

class Button extends StatelessWidget {
  final String? label;
  final void Function()? onPressed;
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double vertical;
  final double horizontal;
  final double fontSize;

  const Button({
    super.key,
    this.label,
    this.onPressed,
    this.width = double.infinity,
    this.height = 60,
    this.vertical = 16,
    this.horizontal = 16,
    this.fontSize = 24,
    this.backgroundColor = Colors.black,
    this.foregroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
      ),
      child: Text(
        '$label',
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}

class Back extends StatelessWidget {
  final Color? backgroundColor;
  final Color? color;
  final void Function()? onPressed;

  const Back({
    super.key,
    this.backgroundColor,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: App.height * 0.04,
        right: App.width * 0.4,
      ),
      child: InkWell(
        onTap: onPressed,
        child: CircleAvatar(
          backgroundColor: backgroundColor,
          radius: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Icon(
              Icons.arrow_back_ios,
              color: color,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class MyElvatedButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? color;
  final void Function()? onPressed;
  final Size? minimumSize;
  const MyElvatedButton({
    super.key,
    this.text,
    this.backgroundColor,
    this.onPressed,
    this.color,
    this.minimumSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: minimumSize,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20),
            right: Radius.circular(20),
          ),
        ),
      ),
      child: Text(
        '$text',
        style: TextStyle(fontSize: 17, color: color ?? Colors.white),
      ),
    );
  }
}

class MyElvatedButtonIcon extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? fill;
  final double? radius;
  final double? right;
  final Color? color;
  final void Function()? onPressed;
  final Size? minimumSize;
  final Widget? child;
  const MyElvatedButtonIcon({
    super.key,
    this.text,
    this.backgroundColor,
    this.onPressed,
    this.color,
    this.minimumSize,
    this.child,
    this.fill,
    this.radius,
    this.right,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: minimumSize,
        foregroundColor: foregroundColor ?? Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(10),
            right: Radius.circular(10),
          ),
        ),
      ),
      icon: Padding(
        padding: EdgeInsets.only(right: right ?? 0),
        child: CircleAvatar(
          backgroundColor: fill,
          radius: radius,
          child: child,
        ),
      ),
      label: Text(
        '$text',
        style: TextStyle(fontSize: 17, color: color ?? Colors.white),
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final double horizontal;
  final double vertical;
  final TextStyle? style;
  const MyTextButton({
    super.key,
    this.text,
    this.onPressed,
    this.horizontal = 0,
    this.vertical = 0,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: Text('$text'),
      ),
    );
  }
}
