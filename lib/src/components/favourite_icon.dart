import 'package:coffee_shop_app/src/components/appbar.dart';
import 'package:coffee_shop_app/src/modules/favourite/blocs/bloc/favourite_items_bloc.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:coffee_shop_app/src/res/icon_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({
    super.key,
    required this.coffeeId,
  });

  final String coffeeId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteItemsBloc, FavouriteItemsState>(
      // selector: (state) {
      //   if (state is FavouriteItemsLoaded) {
      //     return state.favouriteCoffees.contains(coffeeId)
      //         ? coffeeId
      //         : null;
      //   }
      //   return null;
      // },
      builder: (context, state) {
        final isFavourite =
            context.read<FavouriteItemsBloc>().isFavourite(coffeeId);
        // final isFavourite = state;
        return AppBarIconContainer(
          icon: AppIcons.favourite,
          color: isFavourite ? AppColors.red : AppColors.grey50,
          gradient: AppColors.iconGradient2,
          onTap: () {
            context.read<FavouriteItemsBloc>().add(
                  ToggleFavouriteItem(coffeeId),
                );
          },
        );
      },
    );
  }
}
