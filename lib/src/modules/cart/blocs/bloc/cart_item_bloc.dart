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

      final items = Map<String, CartItem>.from((state as CartItemLoaded).items);
      final cartItem = items[event.coffee.id];
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
        items.update(event.coffee.id, (value) => cartItem);
      } else {
        final newCartItem = CartItem(
          name: event.coffee.name,
          type: event.coffee.type,
          isBean: event.coffee.isBean,
          image: event.coffee.squareImage,
          coffeeId: event.coffee.id,
          sizes: [size],
        );
        await _localCartRepository.addItem(newCartItem);

        items[event.coffee.id] = newCartItem;
      }

      emit(CartItemLoaded(
        items: items,
        totalPrice: (state as CartItemLoaded).totalPrice + size.price,
        totalItems: (state as CartItemLoaded).totalItems + 1,
      ));
      // _fetchCartItems(event, emit);
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

      emit(CartItemLoaded(
        items: cartItems,
        totalPrice: (state as CartItemLoaded).totalPrice + event.size.price,
        totalItems: (state as CartItemLoaded).totalItems + 1,
      ));
    } catch (e) {
      emit(CartItemError(e.toString()));
    }
  }

  void _fetchCartItems(
    CartItemFetch event,
    Emitter<CartItemState> emit,
  ) {
    try {
      emit(CartItemLoading());

      final items = _localCartRepository.getItems();
      _calculateTotalPrice(items, emit);
    } catch (e) {
      emit(CartItemError(e.toString()));
    }
  }

  FutureOr<void> _decrementItem(
    CartItemDecrement event,
    Emitter<CartItemState> emit,
  ) async {
    try {
      final cartItems = Map.of((state as CartItemLoaded).items);
      final coffee = cartItems[event.coffeeId];
      final sizeIndex = coffee!.sizes.indexWhere(
        (element) => element.name == event.size.name,
      );

      final size = coffee.sizes[sizeIndex];
      if (event.size.quantity == 1) {
        if (coffee.sizes.length == 1) {
          await _localCartRepository.removeItem(coffee.coffeeId);
          cartItems.remove(event.coffeeId);
          emit(CartItemLoaded(
            items: cartItems,
            totalPrice: (state as CartItemLoaded).totalPrice - size.price,
            totalItems: (state as CartItemLoaded).totalItems - 1,
          ));
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
      emit(CartItemLoaded(
        items: cartItems,
        totalPrice: (state as CartItemLoaded).totalPrice - size.price,
        totalItems: (state as CartItemLoaded).totalItems - 1,
      ));
      // _fetchCartItems(event, emit);
    } catch (e) {
      emit(CartItemError(e.toString()));
    }
  }

  void _calculateTotalPrice(
      Map<dynamic, CartItem> items, Emitter<CartItemState> emit) {
    double totalPrice = 0;
    int totalItems = 0;

    items.forEach((key, value) {
      for (var element in value.sizes) {
        totalPrice += element.price * element.quantity;
        totalItems += element.quantity;
      }
    });

    emit(CartItemLoaded(
      items: items,
      totalPrice: totalPrice,
      totalItems: totalItems,
    ));
  }
}
