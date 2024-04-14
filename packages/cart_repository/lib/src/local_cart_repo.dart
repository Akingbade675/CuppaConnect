import 'package:cart_repository/cart_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalCartRepository {
  static const String cartsBoxName = 'carts';
  static Box<CartItem>? _cartsBox;

  static Future<void> init() async {
    // Initialize the hive local storage
    await Hive.initFlutter();
    Hive.registerAdapter<CartItem>(CartItemAdapter());
    Hive.registerAdapter<Size>(SizeAdapter());
    _cartsBox = await Hive.openBox<CartItem>(cartsBoxName);
  }

  Future<void> addItem(CartItem item) async {
    if (_cartsBox == null) {
      throw Exception('Local storage not initialized');
    }
    await _cartsBox?.put(item.coffeeId, item);
  }

  Future<void> removeItem(String id) async {
    if (_cartsBox == null) {
      throw Exception('Local storage not initialized');
    }
    await _cartsBox?.delete(id);
  }

  Future<void> updateItem(CartItem item) async {
    if (_cartsBox == null) {
      throw Exception('Local storage not initialized');
    }
    await _cartsBox?.put(item.coffeeId, item);
  }

  Map<dynamic, CartItem> getItems() {
    if (_cartsBox == null) {
      throw Exception('Local storage not initialized');
    }

    return _cartsBox!.toMap();
  }

  CartItem? getItem(String coffeeId) {
    if (_cartsBox == null) {
      throw Exception('Local storage not initialized');
    }
    return _cartsBox?.get(coffeeId);
  }

  Future<void> clear() async {
    if (_cartsBox == null) {
      throw Exception('Local storage not initialized');
    }
    await _cartsBox?.clear();
  }

  Future<void> close() async {
    await _cartsBox?.close();
  }

  Future<void> delete() async {
    await Hive.deleteBoxFromDisk(cartsBoxName);
  }
}
