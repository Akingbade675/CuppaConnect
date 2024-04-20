import 'package:coffee_repository/coffee_repository.dart';
import 'package:coffee_shop_app/src/components/coffee_text.dart';
import 'package:coffee_shop_app/src/components/custom_hero_widget.dart';
import 'package:coffee_shop_app/src/components/favourite_icon.dart';
import 'package:coffee_shop_app/src/components/rounded_container.dart';
import 'package:coffee_shop_app/src/components/svg_icon.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeDetailsImageWidget extends StatelessWidget {
  final CoffeeItem coffee;
  final double? height;
  final BorderRadius? borderRadius;
  final bool showFavouriteIcon;
  final VoidCallback? onTap;

  const CoffeeDetailsImageWidget({
    super.key,
    this.borderRadius,
    this.showFavouriteIcon = false,
    this.height,
    this.onTap,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height?.h ?? MediaQuery.of(context).size.height * 0.56,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: borderRadius ?? BorderRadius.circular(0),
                child: HeroWidget(
                  tag: 'coffeeImage_${coffee.id}',
                  child: Image.asset(
                    coffee.portraitImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CoffeeDetailsImageOverlay(
                id: coffee.id,
                name: coffee.name,
                type: coffee.type,
                isBean: coffee.isBean,
              ),
            ),
            if (showFavouriteIcon)
              Positioned(
                right: 20.w,
                top: 26.h,
                child: FavouriteIcon(coffeeId: coffee.id),
              ),
          ],
        ),
      ),
    );
  }
}

class CoffeeDetailsImageOverlay extends StatelessWidget {
  final String id;
  final String name;
  final String type;
  final bool isBean;

  const CoffeeDetailsImageOverlay({
    super.key,
    required this.id,
    required this.name,
    required this.type,
    this.isBean = false,
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
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: HeroWidget(
                        tag: 'coffeeTitleText_$id',
                        child: CoffeeTitleText(
                          text: name,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    HeroWidget(
                      tag: 'coffeeSideText_$id',
                      child: CoffeeSideText(
                        text: type,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // const Spacer(),
              SizedBox(width: 15.w),
              _buildCoffeeContentContainer(
                context,
                icon: isBean ? AppIcons.bean : AppIcons.coffee,
                text: isBean ? 'Bean' : 'Coffee',
              ),
              SizedBox(width: 20.w),
              _buildCoffeeContentContainer(
                context,
                icon: isBean ? AppIcons.location : AppIcons.milk,
                text: isBean ? 'Africa' : 'Milk',
              ),
            ],
          ),
          SizedBox(height: 13.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeroWidget(
                tag: 'coffeeRatingBar_$id',
                child: const SvgIcon(AppIcons.star,
                    color: AppColors.brown, size: 22),
              ),
              SizedBox(width: 6.w),
              HeroWidget(
                tag: 'coffeeRating_$id',
                child: Text(
                  '4.5',
                  style: context.textTheme.bodyLarge?.copyWith(fontSize: 16.sp),
                ),
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
