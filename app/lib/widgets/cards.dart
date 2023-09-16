import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final void Function()? onPressed;
  final AlignmentGeometry? alignment;
  final AlignmentGeometry? transformAlignment;
  final BoxConstraints? constraints;
  final Clip clipBehavior;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Matrix4? transform;
  final Widget? child;
  final double? height;
  final double? width;
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;
  final BorderRadiusGeometry? borderRadius;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  final Color shadow;
  final Offset offset;
  final double blurRadius;
  final double spreadRadius;
  final BlurStyle blurStyle;

  const Cards({
    super.key,
    this.onPressed,
    this.alignment,
    this.transformAlignment,
    this.constraints,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.margin,
    this.padding,
    this.transform,
    this.child,
    this.height,
    this.width,
    this.clipBehavior = Clip.none,
    this.minWidth = 0.0,
    this.maxWidth = double.infinity,
    this.minHeight = 0.0,
    this.maxHeight = double.infinity,
    this.borderRadius,
    this.topLeft = 0,
    this.topRight = 0,
    this.bottomLeft = 0,
    this.bottomRight = 0,
    this.shadow = Colors.transparent,
    this.offset = Offset.zero,
    this.blurRadius = 0,
    this.spreadRadius = 0,
    this.blurStyle = BlurStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: alignment,
        constraints: constraints ??
            BoxConstraints(
              minHeight: minHeight,
              maxHeight: maxHeight,
              minWidth: maxHeight,
              maxWidth: maxWidth,
            ),
        transformAlignment: transformAlignment,
        foregroundDecoration: foregroundDecoration,
        margin: margin,
        padding: padding,
        transform: transform,
        height: height,
        width: width,
        clipBehavior: clipBehavior,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ??
              BorderRadius.only(
                bottomLeft: Radius.circular(bottomLeft),
                bottomRight: Radius.circular(bottomRight),
                topLeft: Radius.circular(topLeft),
                topRight: Radius.circular(topRight),
              ),
          boxShadow: [
            BoxShadow(
              color: shadow,
              offset: offset,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
              blurStyle: blurStyle,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
