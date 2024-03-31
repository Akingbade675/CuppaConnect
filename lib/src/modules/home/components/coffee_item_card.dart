import 'package:coffee_shop_app/src/components/app_icon_button.dart';
import 'package:coffee_shop_app/src/components/coffee_text.dart';
import 'package:coffee_shop_app/src/components/price_widget.dart';
import 'package:coffee_shop_app/src/constants/coffees_data.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/home/views/coffee_detail_screen.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoffeeItemCard extends StatelessWidget {
  final Coffee data;
  final bool isBean;

  const CoffeeItemCard({super.key, required this.data, this.isBean = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22.r),
      onTap: () {
        context.push(CoffeeDetailScreen(data: data));
      },
      child: Container(
        // height: 239.h,
        width: 150.w,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          gradient: AppColors.coffeeItemGradient,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Column(
          children: [
            CoffeeImageWidget(imageString: data.squareImage, isBean: isBean),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoffeeTitleText(text: data.name),
                  SizedBox(height: 5.h),
                  CoffeeSideText(
                    text: data.type,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      PriceWidget(
                        price: data.prices.values.first,
                        fontSize: 15,
                      ),
                      const Spacer(),
                      const AppIconButton(
                        iconPath: AppIcons.plus,
                        size: 28,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeImageWidget extends StatelessWidget {
  final bool isBean;
  final String imageString;

  const CoffeeImageWidget({
    super.key,
    required this.imageString,
    required this.isBean,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 126.h,
          decoration: BoxDecoration(
            color: AppColors.grey50.withOpacity(0.16),
            borderRadius: BorderRadius.circular(22.r),
            image: DecorationImage(
              image: AssetImage(imageString),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (!isBean)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.6),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(22.r),
                  bottomLeft: Radius.circular(22.r),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/filter.svg',
                    width: 10.w,
                  ),
                  const SizedBox(width: 2),
                  Text('4.5',
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 10.sp,
                        color: AppColors.white,
                      )),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
