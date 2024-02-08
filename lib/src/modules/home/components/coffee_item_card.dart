import 'package:coffee_shop_app/src/components/app_icon_button.dart';
import 'package:coffee_shop_app/src/components/coffee_text.dart';
import 'package:coffee_shop_app/src/res/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoffeeItemCard extends StatelessWidget {
  const CoffeeItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 239.h,
      // width: 150,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 128.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/coffee_1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.16),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/filter.svg',
                        width: 10.w,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '4.8',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CoffeeTitleText(),
                const CoffeeSideText(),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$ 4.53',
                      style: TextStyle(
                        color: const Color(0xFF2F4B4E),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    const AppIconButton(
                      iconPath: AppIcons.plus,
                      size: 32,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
