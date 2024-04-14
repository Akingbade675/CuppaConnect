import 'package:flutter/material.dart';

class CircleTabIndicator extends Decoration {
  final double radius;
  final Color color;

  const CircleTabIndicator({required this.radius, required this.color});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(this);
  }
}

class _CirclePainter extends BoxPainter {
  final CircleTabIndicator decoration;

  _CirclePainter(this.decoration);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset = offset +
        Offset(cfg.size!.width / 2, cfg.size!.height - decoration.radius);
    final Paint paint = Paint()
      ..color = decoration.color
      ..isAntiAlias = true;
    canvas.drawCircle(circleOffset, decoration.radius, paint);
  }
}
