import 'package:cart_repository/cart_repository.dart';
import 'package:coffee_shop_app/app_view.dart';
import 'package:coffee_shop_app/src/modules/cart/blocs/bloc/cart_item_bloc.dart';
import 'package:coffee_shop_app/src/modules/favourite/blocs/bloc/favourite_items_bloc.dart';
import 'package:favourite_repository/favourite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => LocalCartRepository(),
        ),
        RepositoryProvider(
          create: (context) => LocalFavouriteRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CartItemBloc(
              context.read<LocalCartRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => FavouriteItemsBloc(
              context.read<LocalFavouriteRepository>(),
            )..add(LoadFavouriteItems()),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}
