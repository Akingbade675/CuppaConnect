import 'package:flutter/material.dart';

class WidgetScaleTransition extends StatelessWidget {
  final Widget child;

  const WidgetScaleTransition({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

class WidgetSlideTransition extends StatelessWidget {
  final Widget child;

  const WidgetSlideTransition({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        final animationOffset =
            Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                .animate(animation);
        return SlideTransition(
          position: animationOffset,
          child: child,
        );
      },
      child: child,
    );
  }
}
