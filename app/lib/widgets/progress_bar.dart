import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Animated progress bar. Behaves like implicitly animated widget.
/// Check basic implicit animated Flutter widgets like [AnimatedContainer]
/// It animates [value] changes.
/// Requires [duration] to set filling duration timer
/// [onEnd] callback to trigger additional actions (e.g. another animation)
/// at the end of the current animation
/// [color] or [gradient] to fill the progress bar. Only one parameter is allowed.
/// Optional [backgroundColor], defaults to transparent
/// Optional [width] defaults to 200.0
/// Optional [height] defaults to 10.0
/// Optional [curve] defaults to [Curves.linear]
class AnimatedProgressBar extends ImplicitlyAnimatedWidget {
  const AnimatedProgressBar({
    key,
    required duration,
    required this.value,
    this.width = 200.0,
    this.height = 10.0,
    this.color,
    this.gradient,
    this.backgroundColor = Colors.transparent,
    curve = Curves.linear,
    onEnd,
  }) : super(key: key, duration: duration, curve: curve, onEnd: onEnd);

  ///progress bar width
  final double width;

  ///progress bar height
  final double height;

  ///current progress value
  final double? value;

  ///progress bar gradient parameter
  final Gradient? gradient;

  ///progress bar color parameter
  final Color? color;

  ///progress bar color parameter
  final Color backgroundColor;

  @override
  AnimatedWidgetBaseState<AnimatedProgressBar> createState() =>
      _AnimatedBarState();
}

class _AnimatedBarState extends AnimatedWidgetBaseState<AnimatedProgressBar> {
  Tween<double>? _progressValue;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _progressValue = visitor(_progressValue, widget.value,
        (dynamic value) => Tween<double>(begin: value)) as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      value: _progressValue?.evaluate(animation),
      width: widget.width,
      height: widget.height,
      gradient: widget.gradient,
      color: widget.color,
      backgroundColor: widget.backgroundColor,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<Tween>('progressValue', _progressValue,
        showName: false, defaultValue: null));
  }
}

///Background progress bar painter
///Requires [backgroundColor] to set progress bar background color
class BackgroundPainter extends CustomPainter {
  const BackgroundPainter({required this.backgroundColor});

  ///progress bar backgroundColor
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = backgroundColor;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Offset.zero & size, Radius.circular(size.height / 2)),
        paint);
  }

  @override
  bool shouldRepaint(covariant BackgroundPainter oldDelegate) => false;
}

/// Basic progress bar widget.
///
/// Requires [value] to show progress
/// [color] or [gradient] to fill the progress bar. Only one parameter is allowed.
/// Optional [backgroundColor], defaults to transparent
/// Optional [width] defaults to 200.0
/// Optional [height] defaults to 10.0
class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.value,
    this.width = 200.0,
    this.height = 10.0,
    this.color,
    this.backgroundColor = Colors.transparent,
    this.gradient,
    this.child,
  })  : assert(
          gradient == null || color == null,
          'Cannot provide both a color and a gradient',
        ),
        assert(
          gradient != null || color != null,
          'Need to provide color or gradient',
        ),
        super(key: key);

  ///progress bar width
  final double width;

  ///progress bar height
  final double height;

  ///current progress value
  final double? value;

  ///progress bar gradient parameter
  final Gradient? gradient;

  ///progress bar color parameter
  final Color? color;

  ///progress bar color parameter
  final Color backgroundColor;
  //animation_text.dart
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      foregroundPainter: ProgressPainter(
        value: value!,
        color: color,
        gradient: gradient,
      ),
      painter: BackgroundPainter(
        backgroundColor: backgroundColor,
      ),
      child: child,
    );
  }
}

/// Instantly animating progress bar.
/// Requires [duration] to set filling duration timer
/// [color] or [gradient] to fill the progress bar. Only one parameter is allowed.
/// Optional [backgroundColor], defaults to transparent
/// Optional [width] defaults to 200.0
/// Optional [height] defaults to 10.0
/// Optional [curve] defaults to [Curves.linear]

class ProgressBarAnimation extends StatefulWidget {
  const ProgressBarAnimation({
    Key? key,
    required this.duration,
    this.width = 200.0,
    this.height = 10.0,
    this.color,
    this.gradient,
    this.backgroundColor = Colors.transparent,
    this.curve = Curves.linear,
    this.callback,
    this.child,
    this.padding = EdgeInsets.zero,
    this.removeAt,
    this.index,
  }) : super(key: key);

  ///animation duration
  final int? index;
  final void Function(AnimationController, Animation)? callback;
  final void Function(int)? removeAt;

  ///animation duration
  final Duration duration;

  ///progress bar width
  final double width;

  ///progress bar height
  final double height;

  ///progress bar color
  final Color? color;

  ///progress bar gradient
  final Gradient? gradient;

  ///progress bar backgroundColor
  final Color backgroundColor;

  ///progress bar animation curve
  final Curve curve;

  ///progress bar animation curve
  final Widget? child;
  //animation_text.dart
  final EdgeInsetsGeometry padding;

  @override
  State<ProgressBarAnimation> createState() => _ProgressBarAnimationState();
}

class _ProgressBarAnimationState extends State<ProgressBarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _progressAnimation;
  bool visible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    _controller.forward();
    if (widget.callback != null) {
      widget.callback!(_controller, _progressAnimation);
    }

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        visible = false;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Column(
            children: [
              Padding(
                padding: widget.padding,
                child: ProgressBar(
                  value: _progressAnimation.value,
                  width: widget.width,
                  height: widget.height,
                  gradient: widget.gradient,
                  color: widget.color,
                  backgroundColor: widget.backgroundColor,
                ),
              ),
              SizedBox(child: widget.child),
            ],
          );
        },
      ),
    );
  }
}

///Foreground progress bar painter
///Requires [value] to set progress
///Optional [gradient] or [color] for bar infill
class ProgressPainter extends CustomPainter {
  const ProgressPainter({required this.value, this.gradient, this.color});

  ///current progress bar value
  final double value;

  ///progress bar gradient infill
  final Gradient? gradient;

  ///progress bar gradient color
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    if (gradient != null) {
      paint.shader = gradient?.createShader(Offset.zero & size);
    }
    if (color != null) {
      paint.color = color!;
    }
    canvas.clipRRect(RRect.fromRectAndRadius(
        Offset.zero & size, Radius.circular(size.height / 2)));
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTRB(0, 0, size.width * value, size.height),
            Radius.circular(size.height / 2)),
        paint);
  }

  @override
  bool shouldRepaint(covariant ProgressPainter oldDelegate) {
    return value != oldDelegate.value;
  }
}
