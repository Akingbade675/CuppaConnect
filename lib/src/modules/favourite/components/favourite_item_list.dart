import 'package:coffee_repository/coffee_repository.dart';
import 'package:coffee_shop_app/src/components/coffee_description.dart';
import 'package:coffee_shop_app/src/components/custom_page_router.dart';
import 'package:coffee_shop_app/src/components/empty_coffee.dart';
import 'package:coffee_shop_app/src/extensions/context_ext.dart';
import 'package:coffee_shop_app/src/modules/favourite/blocs/bloc/favourite_items_bloc.dart';
import 'package:coffee_shop_app/src/modules/home/components/details_image.dart';
import 'package:coffee_shop_app/src/modules/home/views/coffee_detail_screen.dart';
import 'package:coffee_shop_app/src/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteItemList extends StatelessWidget {
  const FavouriteItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteItemsBloc, FavouriteItemsState>(
      builder: (context, state) {
        switch (state) {
          case FavouriteItemsLoading():
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          case FavouriteItemsLoaded():
            break;
          case FavouriteItemsError():
            return Center(
              child: Text(state.message),
            );
        }

        if (state.favouriteCoffees.isEmpty) {
          return const EmptyCoffeeItems('No Favourite Items');
        }
        return ListView.builder(
          itemCount: state.favouriteCoffees.length,
          itemBuilder: (ctx, index) {
            final coffeeId = state.favouriteCoffees[index];
            final coffee = CoffeeData.getCoffeeItem(id: coffeeId);

            return GestureDetector(
                onTap: () => context.pushTransition(
                      CustomPageRouter(
                        route: (_, animation, __) => CoffeeDetailScreen(
                          data: coffee,
                          animation: animation,
                        ),
                      ),
                    ),
                child: FavouriteListItemContainer(coffee));
          },
        );
      },
    );
  }
}

class FavouriteListItemContainer extends StatelessWidget {
  final CoffeeItem coffeeItem;

  const FavouriteListItemContainer(this.coffeeItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
        top: 20.h,
        bottom: 8.h,
      ),
      child: Column(
        children: [
          CoffeeDetailsImageWidget(
            height: 457,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                25.w,
              ),
            ),
            showFavouriteIcon: true,
            coffee: coffeeItem,
          ),
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                  25.w,
                ),
              ),
              gradient: AppColors.cartItemGradient,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildCoffeeDescription(
                context,
                text: coffeeItem.description,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
