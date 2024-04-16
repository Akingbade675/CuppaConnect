import 'package:coffee_repository/coffee_repository.dart';
import 'package:hive/hive.dart';

class LocalFavouriteRepository {
  static const favouritesBoxName = 'favourites';
  static Box<bool>? _favouritesBox;

  static init() async {
    // Initialize the local database
    _favouritesBox = await Hive.openBox<bool>(favouritesBoxName);
  }

  Future<void> addFavourite(String coffeeId) async {
    if (_favouritesBox == null) {
      throw Exception('Local storage not initialized');
    }
    await _favouritesBox?.put(coffeeId, true);
  }

  Future<void> removeFavourite(String coffeeId) async {
    if (_favouritesBox == null) {
      throw Exception('Local storage not initialized');
    }
    await _favouritesBox?.delete(coffeeId);
  }

  bool isFavourite(String coffeeId) {
    if (_favouritesBox == null) {
      throw Exception('Local storage not initialized');
    }
    return _favouritesBox!.containsKey(coffeeId);
  }

  List<String> getFavourites() {
    if (_favouritesBox == null) {
      throw Exception('Local storage not initialized');
    }

    return _favouritesBox!.toMap().keys.map((e) => e.toString()).toList();
  }

  List<CoffeeItem> getFavouriteCoffees() {
    if (_favouritesBox == null) {
      throw Exception('Local storage not initialized');
    }

    final favourites = getFavourites();
    return favourites
        .map((coffeeId) => CoffeeData.getCoffeeItem(id: coffeeId))
        .toList();
  }

  Future<void> clear() async {
    if (_favouritesBox == null) {
      throw Exception('Local storage not initialized');
    }
    await _favouritesBox?.clear();
  }

  Future<void> close() async {
    await _favouritesBox?.close();
  }

  Future<void> delete() async {
    await Hive.deleteBoxFromDisk(favouritesBoxName);
  }
}
