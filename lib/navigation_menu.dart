import 'package:coffee_shop_app/src/components/svg_icon.dart';
import 'package:coffee_shop_app/src/modules/cart/views/cart_screen.dart';
import 'package:coffee_shop_app/src/modules/favourite/views/favourite_screen.dart';
import 'package:coffee_shop_app/src/modules/home/views/home_screen.dart';
import 'package:coffee_shop_app/src/modules/order/views/order_history_screen.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';

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

  final ValueNotifier<int> indexNotfier = ValueNotifier(3);

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
                  icon: SvgIcon(item.value, color: AppColors.grey50),
                  selectedIcon: SvgIcon(item.value, color: AppColors.brown),
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
