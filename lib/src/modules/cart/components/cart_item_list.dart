import 'package:coffee_repository/coffee_repository.dart';
import 'package:coffee_shop_app/src/components/empty_coffee.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/cart/blocs/bloc/cart_item_bloc.dart';
import 'package:coffee_shop_app/src/modules/cart/components/multiple_variation_cart_item.dart';
import 'package:coffee_shop_app/src/modules/cart/components/single_variation_cart_item.dart';
import 'package:coffee_shop_app/src/modules/home/views/coffee_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemBloc, CartItemState>(
      builder: (context, state) {
        switch (state) {
          case CartItemLoading():
            return const Center(child: CircularProgressIndicator());
          case CartItemError():
            return Center(child: Text(state.message));
          case CartItemLoaded():
            if (state.items.isEmpty) {
              return const EmptyCoffeeItems('Cart is Empty');
            }
            return ListView.separated(
              itemCount: state.items.length,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              separatorBuilder: (_, __) => SizedBox(height: 16.h),
              itemBuilder: (_, index) {
                final cartItem = state.items.values.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    context.push(
                      CoffeeDetailScreen(
                        data: CoffeeData.getCoffeeItem(
                          id: cartItem.coffeeId,
                          name: cartItem.name,
                        ),
                      ),
                    );
                  },
                  child: cartItem.sizes.length > 1
                      ? MultipleVariationCartItem(item: cartItem)
                      : SingleVariationCartItem(item: cartItem),
                );
              },
            );
        }
      },
    );
  }
}
