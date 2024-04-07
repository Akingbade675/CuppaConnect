import 'package:coffee_shop_app/src/components/svg_icon.dart';
import 'package:coffee_shop_app/src/modules/cart/views/cart_screen.dart';
import 'package:coffee_shop_app/src/modules/favourite/views/favourite_screen.dart';
import 'package:coffee_shop_app/src/modules/home/views/home_screen.dart';
import 'package:coffee_shop_app/src/modules/order/views/order_history_screen.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
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

  int index = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: [_screens[index]],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
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
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
