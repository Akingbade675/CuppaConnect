import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String icon;
  final double size;
  final double? width;
  final double? height;
  final Color color;

  const SvgIcon(
    this.icon, {
    super.key,
    this.size = 24,
    required this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: width?.w ?? size.w,
      height: height?.h ?? size.h,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
