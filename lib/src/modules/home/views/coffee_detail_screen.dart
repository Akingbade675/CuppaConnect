import 'package:coffee_shop_app/src/components/app_icon_button.dart';
import 'package:coffee_shop_app/src/components/coffee_text.dart';
import 'package:coffee_shop_app/src/modules/order/views/order_screen.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoffeeDetailScreen extends StatelessWidget {
  const CoffeeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppIcons.arrowLeft),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppIcons.heart),
            // icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/coffee_1.png',
                    height: 226.h,
                    width: 315.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20.h),
                const CoffeeTitleText(size: 20),
                SizedBox(height: 6.h),
                const CoffeeSideText(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/filter.svg',
                      width: 20.w,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '4.8 ',
                      style: TextStyle(
                        color: const Color(0xFF2F2D2C),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '(230)',
                      style: TextStyle(
                        color: const Color(0xFF808080),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    const AppIconButton(
                      color: Color(0xFFF9F9F9),
                      iconPath: AppIcons.bean,
                      isPng: true,
                      size: 40,
                    ),
                    SizedBox(width: 10.w),
                    const AppIconButton(
                      color: Color(0xFFF9F9F9),
                      iconPath: AppIcons.milk,
                      isPng: true,
                      size: 40,
                    ),
                  ],
                ),
                Divider(
                  height: 40.h,
                  thickness: 1,
                  color: const Color(0xFFEAEAEA),
                ),
                Text(
                  'Description',
                  style: TextStyle(
                    color: const Color(0xFF2F2D2C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                Text.rich(
                  TextSpan(
                      text:
                          'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ',
                      style: TextStyle(
                        color: const Color(0xFF9B9B9B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: 'Read More',
                          style: TextStyle(
                            color: AppColors.brown,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Size',
                  style: TextStyle(
                    color: const Color(0xFF2F2D2C),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppChoiceChip('S'),
                    AppChoiceChip('M', isSelected: true),
                    AppChoiceChip('L'),
                  ],
                ),
                SizedBox(height: 94.h),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 30.w,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFEAEAEA),
                    offset: Offset(0, -2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          color: const Color(0xFF9B9B9B),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        '\$ 4.99',
                        style: TextStyle(
                          color: AppColors.brown,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const OrderScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.brown,
                      padding: EdgeInsets.symmetric(
                        vertical: 24.h,
                        horizontal: 70.w,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const AppChoiceChip(
    this.label, {
    super.key,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: isSelected,
      elevation: 0,
      pressElevation: 0,
      label: Text(label),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
        color: const Color(0xFF2F2D2C),
      ),
      selectedColor: AppColors.lightBrown,
      backgroundColor: Colors.white,
      disabledColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 35,
      ),
      side: BorderSide(
        color: isSelected ? AppColors.brown : const Color(0xFFDEDEDE),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
