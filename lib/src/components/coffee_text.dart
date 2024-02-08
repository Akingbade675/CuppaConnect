import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeTitleText extends StatelessWidget {
  final double size;

  const CoffeeTitleText({
    super.key,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Cuppaccino',
      maxLines: 1,
      overflow: TextOverflow.fade,
      style: TextStyle(
        color: const Color(0xFF2F2D2C),
        fontSize: size.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class CoffeeSideText extends StatelessWidget {
  const CoffeeSideText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'with Chocolate',
      style: TextStyle(
        color: const Color(0xFF9B9B9B),
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
