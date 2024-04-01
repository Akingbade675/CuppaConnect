import 'package:coffee_shop_app/src/components/appbar.dart';
import 'package:coffee_shop_app/src/modules/cart/components/multiple_variation_cart_item.dart';
import 'package:coffee_shop_app/src/modules/cart/components/single_variation_cart_item.dart';
import 'package:coffee_shop_app/src/modules/home/components/price_and_add_to_cart.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:coffee_shop_app/src/res/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppBar(
        leadingIcon: AppIcons.menu,
        iconBg: AppColors.iconGradient1,
        title: 'Cart',
        trailingImage: AppImages.avatar,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              separatorBuilder: (_, __) => SizedBox(height: 16.h),
              itemBuilder: (_, index) {
                return index % 2 == 0
                    ? const MultipleVariationCartItem()
                    : const SingleVariationCartItem();
              },
            ),
          ),
          const PageBottomPrice(
            price: 10.40,
            text: 'Total Price',
            btnText: 'Pay',
          ),
        ],
      ),
    );
  }
}
