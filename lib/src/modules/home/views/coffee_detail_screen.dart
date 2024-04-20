import 'package:cart_repository/cart_repository.dart' as CartSize;
import 'package:coffee_repository/coffee_repository.dart';
import 'package:coffee_shop_app/src/components/appbar.dart';
import 'package:coffee_shop_app/src/components/coffee_description.dart';
import 'package:coffee_shop_app/src/components/custom_hero_widget.dart';
import 'package:coffee_shop_app/src/components/favourite_icon.dart';
import 'package:coffee_shop_app/src/components/rounded_container.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/cart/blocs/bloc/cart_item_bloc.dart';
import 'package:coffee_shop_app/src/modules/cart/components/single_variation_cart_qty_picker.dart';
import 'package:coffee_shop_app/src/modules/home/blocs/cubit/coffee_size_cubit.dart';
import 'package:coffee_shop_app/src/modules/home/components/details_image.dart';
import 'package:coffee_shop_app/src/modules/home/components/price_and_add_to_cart.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeDetailScreen extends StatelessWidget {
  final CoffeeItem data;
  final Animation<double> animation;

  const CoffeeDetailScreen(
      {super.key, required this.data, required this.animation});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoffeeSizeCubit()..selectSize(data.sizes.first),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AAppBar(
          leadingIcon: AppIcons.back,
          trailingIcon: FavouriteIcon(
            coffeeId: data.id,
          ),
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
                    CoffeeDetailsImageWidget(coffee: data),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      child: AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          final curveAnimation = CurvedAnimation(
                            parent: animation,
                            curve: const Interval(
                              0.2,
                              1.0,
                              curve: Curves.easeInExpo,
                            ),
                          );

                          return FadeTransition(
                            opacity: curveAnimation,
                            child: child,
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...buildCoffeeDescription(
                              context,
                              text: data.description,
                            ),
                            ..._buildCoffeeSize(
                              context,
                              sizes: data.sizes,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PriceAndAddToCartWidget(data: data),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCoffeeSize(BuildContext context,
      {required List<CartSize.Size> sizes}) {
    return [
      SizedBox(height: 28.h),
      Text(
        'Size',
        style: context.textTheme.bodyLarge?.copyWith(
          fontSize: 14.sp,
          color: AppColors.grey20,
        ),
      ),
      SizedBox(height: 12.h),
      BlocBuilder<CoffeeSizeCubit, CartSize.Size?>(
        builder: (context, sizeState) {
          return Row(
            children: List.generate(
              sizes.length,
              (index) {
                final isSelected = sizeState == sizes[index];
                final deviceWidth = MediaQuery.of(context).size.width;
                final chipWidth = (deviceWidth - 60.w - 26.w * 2) / 3;
                return Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: index < sizes.length - 1 ? 26 : 0),
                    child: RoundedContainer(
                      size: Size(chipWidth, 40),
                      border: isSelected
                          ? Border.all(
                              color: AppColors.brown,
                              width: 2,
                            )
                          : null,
                      child: FittedBox(
                        child: Text(
                          sizes[index].name,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color:
                                isSelected ? AppColors.brown : AppColors.grey20,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      onTap: () {
                        context
                            .read<CoffeeSizeCubit>()
                            .selectSize(sizes[index]);
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    ];
  }
}

class PriceAndAddToCartWidget extends StatelessWidget {
  const PriceAndAddToCartWidget({
    super.key,
    required this.data,
  });

  final CoffeeItem data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemBloc, CartItemState>(
      builder: (context, cartState) {
        return BlocBuilder<CoffeeSizeCubit, CartSize.Size?>(
            builder: (context, sizeState) {
          if (cartState is CartItemLoaded &&
              _isCartItem(cartState, sizeState)) {
            final item = cartState.items.values.firstWhere(
              (element) => element.coffeeId == data.id,
            );

            return PageBottomPrice(
              coffeeId: data.id,
              text: 'Price',
              price: sizeState?.price ?? 0.0,
              btn: HeroWidget(
                tag: 'coffeeCartCount_${item.coffeeId}',
                child: CartUpdateItemWidget(
                  item: item,
                  btnSize: 32,
                  size: item.sizes
                      .firstWhere((element) => element.name == sizeState?.name),
                ),
              ),
            );
          }
          return PageBottomPrice(
            coffeeId: data.id,
            text: 'Price',
            btnText: 'Add to Cart',
            price: sizeState?.price ?? 0.0,
            onBtnPressed: () => context.read<CartItemBloc>().add(
                  CartItemAdd(data, sizeState!),
                ),
          );
        });
      },
    );
  }

  bool _isCartItem(CartItemLoaded cartState, CartSize.Size? sizeState) {
    return cartState.items.values.any(
      (element) =>
          element.coffeeId == data.id &&
          element.sizes.any((element) => element.name == sizeState?.name),
    );
  }
}
