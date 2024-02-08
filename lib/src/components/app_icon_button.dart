import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String iconPath;
  final Color color;
  final Color iconColor;
  final double size;
  final double padding;
  final bool isPng;

  const AppIconButton({
    super.key,
    this.onPressed,
    required this.iconPath,
    required this.size,
    this.padding = 6,
    this.color = AppColors.brown,
    this.iconColor = Colors.white,
    this.isPng = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.w,
        height: size.w,
        padding: EdgeInsets.all(padding.w),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: isPng
            ? Image.asset(iconPath)
            : SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
      ),
    );
  }
}
