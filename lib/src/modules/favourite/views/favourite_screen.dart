import 'package:coffee_shop_app/src/components/appbar.dart';
import 'package:coffee_shop_app/src/modules/favourite/components/favourite_item_list.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:coffee_shop_app/src/res/image_strings.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppBar(
        title: 'Favorites',
        leadingIcon: AppIcons.menu,
        trailingImage: AppImages.avatar,
        iconBg: AppColors.iconGradient1,
      ),
      body: const FavouriteItemList(),
    );
  }
}
