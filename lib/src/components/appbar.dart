import 'package:coffee_shop_app/src/components/svg_icon.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AAppBar extends StatelessWidget implements PreferredSize {
  final String? title;
  final String leadingIcon;
  final Widget? trailingIcon;
  final Color? trailingColor;
  final String? trailingImage;
  final Gradient iconBg;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onTrailingPressed;

  const AAppBar({
    super.key,
    this.title,
    required this.leadingIcon,
    required this.iconBg,
    this.trailingIcon,
    this.trailingImage,
    this.onLeadingPressed,
    this.onTrailingPressed,
    this.trailingColor,
  });
  // : assert(
  //         trailingIcon != null || trailingImage != null,
  //         'trailingIcon or trailingImage must be provided',
  //       );

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
          onTap: onLeadingPressed,
          icon: leadingIcon,
          gradient: iconBg,
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
              : trailingIcon,
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
  final Color color;
  final Gradient gradient;
  final VoidCallback? onTap;

  const AppBarIconContainer({
    super.key,
    required this.icon,
    this.color = AppColors.grey50,
    required this.gradient,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.h,
        width: 30.h,
        padding: EdgeInsets.all(6.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.iconGrey,
          ),
          gradient: gradient,
        ),
        child: SvgIcon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
