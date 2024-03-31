import 'package:coffee_shop_app/src/components/coffee_text.dart';
import 'package:coffee_shop_app/src/components/rounded_container.dart';
import 'package:coffee_shop_app/src/components/svg_icon.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeDetailsImageWidget extends StatelessWidget {
  final String image;
  final String name;
  final String type;

  const CoffeeDetailsImageWidget({
    super.key,
    required this.image,
    required this.name,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.56,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CoffeeDetailsImageOverlay(name: name, type: type),
          ),
        ],
      ),
    );
  }
}

class CoffeeDetailsImageOverlay extends StatelessWidget {
  final String name;
  final String type;

  const CoffeeDetailsImageOverlay({
    super.key,
    required this.name,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 18.h,
      ).copyWith(bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.5),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.w),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoffeeTitleText(
                    text: name,
                    size: 20,
                  ),
                  SizedBox(height: 2.h),
                  CoffeeSideText(
                    text: type,
                    size: 12,
                  ),
                ],
              ),
              const Spacer(),
              _buildCoffeeContentContainer(context,
                  icon: AppIcons.coffee, text: 'Coffee'),
              SizedBox(width: 20.w),
              _buildCoffeeContentContainer(context,
                  icon: AppIcons.milk, text: 'Milk'),
            ],
          ),
          SizedBox(height: 13.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SvgIcon(AppIcons.star, color: AppColors.brown, size: 22),
              SizedBox(width: 6.w),
              Text(
                '4.5',
                style: context.textTheme.bodyLarge?.copyWith(fontSize: 16.sp),
              ),
              SizedBox(width: 5.w),
              Text(
                '(6,879)',
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.grey20,
                  fontSize: 10.sp,
                ),
              ),
              const Spacer(),
              RoundedContainer(
                size: const Size(132, 45),
                child: Text(
                  'Medium Roasted',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 10.sp,
                    color: AppColors.grey20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCoffeeContentContainer(
    BuildContext context, {
    required String icon,
    required String text,
  }) {
    return RoundedContainer(
      size: const Size.square(56),
      child: Column(
        children: [
          SvgIcon(
            icon,
            color: AppColors.brown,
            size: 20,
          ),
          SizedBox(height: 4.h),
          Text(
            text,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 10.sp,
              color: AppColors.grey20,
            ),
          ),
        ],
      ),
    );
  }
}
