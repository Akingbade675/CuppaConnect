import 'package:coffee_shop_app/src/components/appbar.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/cart/blocs/bloc/cart_item_bloc.dart';
import 'package:coffee_shop_app/src/modules/cart/components/cart_item_list.dart';
import 'package:coffee_shop_app/src/modules/home/components/price_and_add_to_cart.dart';
import 'package:coffee_shop_app/src/modules/payment/views/payment_screen.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:coffee_shop_app/src/res/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: const CartItemList(),
      bottomNavigationBar: _buildCartBottomBar(),
    );
  }

  BlocBuilder<CartItemBloc, CartItemState> _buildCartBottomBar() {
    return BlocBuilder<CartItemBloc, CartItemState>(
      builder: (context, state) {
        if (state is CartItemLoaded && state.items.isNotEmpty) {
          return PageBottomPrice(
            price: state.totalPrice,
            text: 'Total Price',
            btnText: 'Pay',
            onBtnPressed: () => context.push(const PaymentScreen()),
          );
        }
        return const SizedBox();
      },
    );
  }
}
