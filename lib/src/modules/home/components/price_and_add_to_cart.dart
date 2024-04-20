import 'package:coffee_shop_app/src/components/custom_hero_widget.dart';
import 'package:coffee_shop_app/src/components/price_widget.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageBottomPrice extends StatelessWidget {
  final String? coffeeId;
  final String text;
  final Widget? btn;
  final String? btnText;
  final double price;
  final VoidCallback? onBtnPressed;

  const PageBottomPrice({
    super.key,
    required this.price,
    required this.text,
    this.btnText,
    this.onBtnPressed,
    this.btn,
    this.coffeeId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 20.w,
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.grey20,
                ),
              ),
              SizedBox(height: 8.h),
              HeroWidget(
                tag: 'coffeePrice_$coffeeId',
                child: PriceWidget(price: price, fontSize: 20),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 60.h,
            width: 240.w,
            child: btn ??
                HeroWidget(
                  tag: 'coffeeAddToCart_$coffeeId',
                  child: ElevatedButton(
                    onPressed: onBtnPressed ?? () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.brown,
                      elevation: 0,
                      minimumSize: Size(240.w, 60.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: FittedBox(
                      child: Text(
                        btnText ?? '',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
