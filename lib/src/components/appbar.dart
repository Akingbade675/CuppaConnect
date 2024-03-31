import 'package:coffee_shop_app/src/components/svg_icon.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AAppBar extends StatelessWidget implements PreferredSize {
  final String? title;
  final String leadingIcon;
  final String? trailingIcon;
  final String? trailingImage;
  final Color? iconBgColor;
  final Color? iconBorderColor;

  const AAppBar({
    super.key,
    this.title,
    required this.leadingIcon,
    this.trailingIcon,
    this.trailingImage,
    this.iconBgColor,
    this.iconBorderColor,
  }) : assert(
          trailingIcon != null || trailingImage != null,
          'trailingIcon or trailingImage must be provided',
        );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      leadingWidth: 60.w,
      title: title != null
          ? Text(
              title!,
              style: context.textTheme.headlineMedium,
            )
          : null,
      leading: Padding(
        padding: EdgeInsets.only(left: 30.w, top: 12.h, bottom: 12.h),
        child: AppBarIconContainer(
          icon: leadingIcon,
          bgColor: iconBgColor,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 30.w),
          child: trailingImage != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    AppImages.avatar,
                    width: 30.w,
                    height: 30.h,
                  ),
                )
              : AppBarIconContainer(icon: trailingIcon!, bgColor: iconBgColor),
        ),
      ],
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarIconContainer extends StatelessWidget {
  final String icon;
  final Color? bgColor;
  final Color? borderColor;

  const AppBarIconContainer({
    super.key,
    required this.icon,
    this.bgColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.h,
      width: 33.w,
      padding: EdgeInsets.all(7.5.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: borderColor ?? AppColors.gradientGrey,
        ),
        color: bgColor,
        gradient: bgColor == null ? AppColors.linearGradient : null,
      ),
      child: SvgIcon(
        icon,
        color: AppColors.white.withOpacity(0.18),
      ),
    );
  }
}
