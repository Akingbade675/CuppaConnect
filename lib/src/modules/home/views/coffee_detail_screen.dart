import 'package:coffee_shop_app/src/components/appbar.dart';
import 'package:coffee_shop_app/src/components/rounded_container.dart';
import 'package:coffee_shop_app/src/constants/coffees_data.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/home/components/details_image.dart';
import 'package:coffee_shop_app/src/modules/home/components/price_and_add_to_cart.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class CoffeeDetailScreen extends StatelessWidget {
  final Coffee data;

  const CoffeeDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AAppBar(
        leadingIcon: AppIcons.back,
        trailingIcon: AppIcons.favourite,
        iconBgColor: AppColors.black,
        iconBorderColor: AppColors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoffeeDetailsImageWidget(
                    image: data.portraitImage,
                    name: data.name,
                    type: data.type,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ..._buildCoffeeDescription(
                          context,
                          text: data.description,
                        ),
                        ..._buildCoffeeSize(
                          context,
                          sizes: data.prices.keys.toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          PriceAndAddToCartWidget(price: data.prices.values.first),
        ],
      ),
    );
  }

  List<Widget> _buildCoffeeDescription(
    BuildContext context, {
    required String text,
  }) {
    return [
      Text(
        'Description',
        style: context.textTheme.bodyLarge?.copyWith(
          fontSize: 14.sp,
          color: AppColors.grey20,
        ),
      ),
      SizedBox(height: 10.h),
      ReadMoreText(
        text,
        trimLines: 3,
        colorClickableText: AppColors.brown,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Read More',
        trimExpandedText: 'Show Less',
        style: context.textTheme.bodySmall?.copyWith(
          color: AppColors.grey20,
        ),
        moreStyle: context.textTheme.bodyLarge?.copyWith(
          fontSize: 14.sp,
        ),
      ),
      SizedBox(height: 20.h),
    ];
  }

  List<Widget> _buildCoffeeSize(BuildContext context,
      {required List<String> sizes}) {
    return [
      Text(
        'Size',
        style: context.textTheme.bodyLarge?.copyWith(
          fontSize: 14.sp,
          color: AppColors.grey20,
        ),
      ),
      SizedBox(height: 12.h),
      Row(
        children: List.generate(
          3,
          (index) {
            final isSelected = index == 1;
            final deviceWidth = MediaQuery.of(context).size.width;
            final chipWidth = (deviceWidth - 40.w - 24.w * 2) / 3;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                RoundedContainer(
                  size: Size(chipWidth, 40),
                  border: isSelected
                      ? Border.all(
                          color: AppColors.brown,
                          width: 2,
                        )
                      : null,
                  child: Center(
                    child: Text(
                      sizes[index],
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: isSelected ? AppColors.brown : AppColors.grey20,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                if (index != 2) SizedBox(width: 24.w),
              ],
            );
          },
        ),
      ),
    ];
  }
}
