part of 'cart_item_bloc.dart';

@immutable
sealed class CartItemEvent {}

final class CartItemFetch extends CartItemEvent {}

final class CartItemAdd extends CartItemEvent {
  final CoffeeItem coffee;
  final Size size;

  CartItemAdd(this.coffee, this.size);
}

final class CartItemRemove extends CartItemEvent {
  final CoffeeItem coffee;

  CartItemRemove(this.coffee);
}

final class CartItemIncrement extends CartItemEvent {
  final String coffeeId;
  final Size size;

  CartItemIncrement({required this.coffeeId, required this.size});
}

final class CartItemDecrement extends CartItemEvent {
  final String coffeeId;
  final Size size;

  CartItemDecrement({required this.coffeeId, required this.size});
}

final class CartItemClear extends CartItemEvent {}
