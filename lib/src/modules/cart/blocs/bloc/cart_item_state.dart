// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_item_bloc.dart';

@immutable
sealed class CartItemState extends Equatable {
  const CartItemState();

  @override
  List<Object> get props => [];
}

final class CartItemLoading extends CartItemState {}

final class CartItemLoaded extends CartItemState {
  final int totalItems;
  final double totalPrice;
  final Map<dynamic, CartItem> items;

  const CartItemLoaded({
    required this.items,
    required this.totalItems,
    required this.totalPrice,
  });

  @override
  List<Object> get props => [...items.values.toList(), totalItems, totalPrice];
}

final class CartItemError extends CartItemState {
  final String message;

  const CartItemError(this.message);

  @override
  List<Object> get props => [message];
}
