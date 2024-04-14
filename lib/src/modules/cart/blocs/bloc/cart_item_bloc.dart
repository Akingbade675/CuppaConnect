import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:coffee_repository/coffee_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cart_item_event.dart';
part 'cart_item_state.dart';

class CartItemBloc extends Bloc<CartItemEvent, CartItemState> {
  final LocalCartRepository _localCartRepository;

  CartItemBloc(this._localCartRepository) : super(CartItemLoading()) {
    on<CartItemAdd>(_addItemToCart);
    on<CartItemIncrement>(_incrementItem);
    on<CartItemFetch>(_fetchCartItems);
    on<CartItemDecrement>(_decrementItem);
  }

  FutureOr<void> _addItemToCart(
    CartItemAdd event,
    Emitter<CartItemState> emit,
  ) async {
    try {
      final size = event.size.copyWith(quantity: 1);

      final cartItem = _localCartRepository.getItem(event.coffee.id);
      if (cartItem != null) {
        final sizeIndex = cartItem.sizes.indexWhere(
          (element) => element.name == size.name,
        );

        if (sizeIndex != -1) {
          cartItem.sizes[sizeIndex] = size.copyWith(
            quantity: cartItem.sizes[sizeIndex].quantity + 1,
          );
        } else {
          cartItem.sizes.add(size);
        }

        await _localCartRepository.updateItem(cartItem);
        // coffees[event.coffeeId] = cartItem;
        // emit(CartItemLoaded(_localCartRepository.getItems()));
      } else {
        final newCartItem = CartItem(
          name: event.coffee.name,
          type: event.coffee.type,
          image: event.coffee.squareImage,
          coffeeId: event.coffee.id,
          sizes: [size],
        );
        await _localCartRepository.addItem(newCartItem);

        // coffees[event.coffeeId] = newCartItem;
      }

      _fetchCartItems(event, emit);
    } catch (e) {
      emit(CartItemError(e.toString()));
    }
  }

  FutureOr<void> _incrementItem(
    CartItemIncrement event,
    Emitter<CartItemState> emit,
  ) async {
    try {
      final cartItems = (state as CartItemLoaded).items;
      final coffee = cartItems[event.coffeeId];
      final sizeIndex = coffee!.sizes.indexWhere(
        (element) => element.name == event.size.name,
      );

      if (sizeIndex != -1) {
        coffee.sizes[sizeIndex] = event.size.copyWith(
          quantity: event.size.quantity + 1,
        );
      } else {
        coffee.sizes.add(event.size.copyWith(quantity: 1));
      }

      await _localCartRepository.updateItem(coffee);
      cartItems.update(event.coffeeId, (value) => coffee);
      _fetchCartItems(event, emit);
    } catch (e) {
      emit(CartItemError(e.toString()));
    }
  }

  void _fetchCartItems(
    event,
    Emitter<CartItemState> emit,
  ) {
    try {
      emit(CartItemLoading());

      emit(CartItemLoaded(_localCartRepository.getItems()));
    } catch (e) {
      emit(CartItemError(e.toString()));
    }
  }

  FutureOr<void> _decrementItem(
    CartItemDecrement event,
    Emitter<CartItemState> emit,
  ) async {
    try {
      final cartItems = (state as CartItemLoaded).items;
      final coffee = cartItems[event.coffeeId];
      final sizeIndex = coffee!.sizes.indexWhere(
        (element) => element.name == event.size.name,
      );

      if (event.size.quantity == 1) {
        if (coffee.sizes.length == 1) {
          await _localCartRepository.removeItem(coffee.coffeeId);
          cartItems.remove(event.coffeeId);
          // emit(CartItemLoaded(cartItems));
          _fetchCartItems(event, emit);
          return;
        } else {
          coffee.sizes.removeAt(sizeIndex);
        }
      } else {
        coffee.sizes[sizeIndex] = event.size.copyWith(
          quantity: event.size.quantity - 1,
        );
      }

      await _localCartRepository.updateItem(coffee);
      cartItems.update(event.coffeeId, (value) => coffee);
      // print(cartItems[event.coffeeId]);
      // emit(CartItemLoaded(cartItems));
      _fetchCartItems(event, emit);
    } catch (e) {
      emit(CartItemError(e.toString()));
    }
  }
}
