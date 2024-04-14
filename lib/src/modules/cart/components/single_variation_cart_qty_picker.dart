import 'package:cart_repository/cart_repository.dart' as cart;
import 'package:coffee_shop_app/src/components/app_icon_button.dart';
import 'package:coffee_shop_app/src/components/price_widget.dart';
import 'package:coffee_shop_app/src/components/rounded_container.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/cart/blocs/bloc/cart_item_bloc.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleVariationCartQuantityPicker extends StatelessWidget {
  final cart.CartItem item;

  const SingleVariationCartQuantityPicker(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = item.sizes.first;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RoundedContainer(
              size: const Size(75, 35),
              color: AppColors.black,
              child: FittedBox(
                child: Text(
                  size.name,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            PriceWidget(price: size.price, fontSize: 18),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppIconButton(
              size: 28,
              iconPath: AppIcons.minus,
              onPressed: () => context.read<CartItemBloc>().add(
                    CartItemIncrement(
                      coffeeId: item.coffeeId,
                      size: size,
                    ),
                  ),
            ),
            RoundedContainer(
              padding: 0,
              borderRadius: 7,
              color: AppColors.black,
              size: const Size(50, 30),
              border: Border.all(color: AppColors.brown),
              child: FittedBox(
                child: Text(
                  size.quantity.toString(),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            AppIconButton(
              size: 28,
              iconPath: AppIcons.plus,
              onPressed: () => context.read<CartItemBloc>().add(
                    CartItemDecrement(
                      coffeeId: item.coffeeId,
                      size: size,
                    ),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
