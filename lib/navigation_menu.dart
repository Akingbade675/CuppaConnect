import 'package:coffee_shop_app/src/components/svg_icon.dart';
import 'package:coffee_shop_app/src/modules/cart/blocs/bloc/cart_item_bloc.dart';
import 'package:coffee_shop_app/src/modules/cart/views/cart_screen.dart';
import 'package:coffee_shop_app/src/modules/favourite/views/favourite_screen.dart';
import 'package:coffee_shop_app/src/modules/home/views/home_screen.dart';
import 'package:coffee_shop_app/src/modules/order/views/order_history_screen.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  Map<String, String> get _icons => {
        'Home': AppIcons.home,
        'Bag': AppIcons.bag,
        'Favourite': AppIcons.favourite,
        'Notification': AppIcons.notification,
      };

  List<Widget> get _screens => [
        const HomeScreen(),
        const CartScreen(),
        const FavouriteScreen(),
        const OrderHistoryScreen(),
      ];

  final ValueNotifier<int> indexNotfier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: indexNotfier,
        builder: (context, value, child) {
          return IndexedStack(
            children: [_screens[value]],
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: indexNotfier,
        builder: (context, value, child) {
          return NavigationBar(
            selectedIndex: value,
            backgroundColor: AppColors.black,
            elevation: 0,
            surfaceTintColor: AppColors.transparent,
            indicatorColor: AppColors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: [
              for (MapEntry<String, String> item in _icons.entries)
                NavigationDestination(
                  icon: item.value == AppIcons.bag
                      ? BadgeIcon(
                          child: SvgIcon(item.value, color: AppColors.grey50),
                        )
                      : SvgIcon(item.value, color: AppColors.grey50),
                  selectedIcon: item.value == AppIcons.bag
                      ? BadgeIcon(
                          child: SvgIcon(item.value, color: AppColors.brown),
                        )
                      : SvgIcon(item.value, color: AppColors.brown),
                  label: item.key,
                ),
            ],
            onDestinationSelected: (value) {
              indexNotfier.value = value;
            },
          );
        },
      ),
    );
  }
}

class BadgeIcon extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? textColor;

  const BadgeIcon({
    super.key,
    required this.child,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemBloc, CartItemState>(builder: (context, state) {
      if (state is CartItemLoaded && state.items.isNotEmpty) {
        return Badge.count(
          count: state.totalItems,
          backgroundColor: backgroundColor,
          textColor: textColor,
          child: child,
        );
      }

      return child;
    });
  }
}
