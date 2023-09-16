import 'package:flutter/material.dart';

class MContainer extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Widget? child;
  final Clip clipBehavior;

  final BorderRadiusGeometry? borderRadius;
  final Radius? topLeft;
  final Radius? topRight;
  final Radius? bottomLeft;
  final Radius? bottomRight;

  final double radiusTopLeft;
  final double radiusTopRight;
  final double radiusBottomLeft;
  final double radiusBottomRight;

  final List<BoxShadow>? boxShadow;

  const MContainer({
    super.key,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
    this.borderRadius,
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.radiusTopLeft = 0,
    this.radiusTopRight = 0,
    this.radiusBottomLeft = 0,
    this.radiusBottomRight = 0,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration ??
          BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: borderRadius ??
                BorderRadius.only(
                  topLeft: topLeft ?? Radius.circular(radiusTopLeft),
                  topRight: topRight ?? Radius.circular(radiusTopRight),
                  bottomLeft: bottomLeft ?? Radius.circular(radiusBottomLeft),
                  bottomRight:
                      bottomRight ?? Radius.circular(radiusBottomRight),
                ),
            boxShadow: boxShadow,
          ),
      child: child,
    );
  }
}

class Containers extends StatelessWidget {
  final Color color;
  final Color shadow;
  final Offset offset;
  final double blurRadius;
  final BorderRadiusGeometry? borderRadius;
  final double bottomLeft;
  final double bottomRight;
  final double topLeft;
  final double topRight;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Widget? child;
  final void Function()? onPressed;

  const Containers({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.alignment,
    this.child,
    this.borderRadius,
    this.blurRadius = 0.0,
    this.color = Colors.white,
    this.offset = Offset.zero,
    this.bottomLeft = 0,
    this.bottomRight = 0,
    this.topLeft = 0,
    this.topRight = 0,
    this.shadow = Colors.transparent,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        alignment: alignment,
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
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
