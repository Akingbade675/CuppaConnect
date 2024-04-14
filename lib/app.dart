import 'package:cart_repository/cart_repository.dart';
import 'package:coffee_shop_app/app_view.dart';
import 'package:coffee_shop_app/src/modules/cart/blocs/bloc/cart_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LocalCartRepository(),
      child: BlocProvider(
        create: (context) => CartItemBloc(context.read<LocalCartRepository>()),
        child: const AppView(),
      ),
    );
  }
}
