import 'package:flutter/material.dart';
import '/package.dart';

class LoadingAnimation extends StatelessWidget {
  final Widget widget;
  final bool conditionToLoading;
  const LoadingAnimation({
    super.key,
    required this.widget,
    required this.conditionToLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        widget,
        if (conditionToLoading)
          SizedBox(
            height: App.height,
            width: App.width,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
