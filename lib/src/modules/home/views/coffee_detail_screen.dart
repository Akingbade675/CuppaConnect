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
      appBar: AAppBar(
        leadingIcon: AppIcons.back,
        trailingIcon: AppIcons.favourite,
        iconBg: AppColors.iconGradient2,
        onLeadingPressed: () => context.pop(),
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
                    isBean: data.name.toLowerCase().contains('bean'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
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
          PageBottomPrice(
            text: 'Price',
            btnText: 'Add to Cart',
            price: data.prices.values.first,
          ),
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
        trimLines: 2,
        colorClickableText: AppColors.brown,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Read More',
        trimExpandedText: ' Show Less',
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
        moreStyle: context.textTheme.bodyMedium?.copyWith(
          fontSize: 12.sp,
          color: AppColors.brown,
        ),
        preDataTextStyle: context.textTheme.bodySmall?.copyWith(
          color: AppColors.grey20,
        ),
        postDataTextStyle: context.textTheme.bodySmall?.copyWith(
          color: AppColors.grey20,
        ),
        lessStyle: context.textTheme.bodyMedium?.copyWith(
          fontSize: 12.sp,
          color: AppColors.brown,
        ),
      ),
      SizedBox(height: 20.h),
    ];
  }

  List<Widget> _buildCoffeeSize(BuildContext context,
      {required List<String> sizes}) {
    bool isBean = true;
    if (sizes.contains('Small')) {
      isBean = false;
      sizes = sizes.map((size) => size.substring(0, 1)).toList();
    }
    return [
      SizedBox(height: 8.h),
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
          sizes.length,
          (index) {
            final isSelected = index == 0;
            final deviceWidth = MediaQuery.of(context).size.width;
            final chipWidth = (deviceWidth - 60.w - 26.w * 2) / 3;
            return Expanded(
              child: Row(
                children: [
                  RoundedContainer(
                    size: Size(chipWidth, 40),
                    border: isSelected
                        ? Border.all(
                            color: AppColors.brown,
                            width: 2,
                          )
                        : null,
                    child: Text(
                      sizes[index],
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: isSelected ? AppColors.brown : AppColors.grey20,
                        fontSize: isBean ? 12.sp : 16.sp,
                      ),
                    ),
                  ),
                  if (index < sizes.length) SizedBox(width: 24.w),
                ],
              ),
            );
          },
        ),
      ),
    ];
  }
}
