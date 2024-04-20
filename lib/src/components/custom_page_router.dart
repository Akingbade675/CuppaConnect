import 'package:flutter/material.dart';

class CustomPageRouter extends PageRouteBuilder {
  final Widget Function(BuildContext, Animation<double>, Animation<double>)
      route;

  CustomPageRouter({required this.route})
      : super(
          pageBuilder: route,
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: const Interval(0.0, 0.5),
            );
            return FadeTransition(
              opacity: curvedAnimation,
              child: child,
            );
          },
        );
}
