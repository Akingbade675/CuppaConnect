// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'cart.g.dart';

@HiveType(typeId: 0)
class CartItem extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final bool isBean;
  @HiveField(4)
  final String coffeeId;
  @HiveField(5)
  final List<Size> sizes;

  const CartItem({
    required this.name,
    required this.type,
    required this.image,
    required this.isBean,
    required this.sizes,
    required this.coffeeId,
  });

  @override
  List<Object> get props => [coffeeId, name, sizes, sizes.length, type, image];

  CartItem copyWith({
    String? name,
    String? type,
    String? image,
    bool? isBean,
    String? coffeeId,
    List<Size>? sizes,
  }) {
    return CartItem(
      name: name ?? this.name,
      type: type ?? this.type,
      image: image ?? this.image,
      isBean: isBean ?? this.isBean,
      coffeeId: coffeeId ?? this.coffeeId,
      sizes: sizes ?? this.sizes,
    );
  }

  @override
  bool get stringify => true;
}

@HiveType(typeId: 1)
class Size extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double price;
  @HiveField(2)
  final int quantity;
  @HiveField(3)
  final int sortOrder;

  const Size({required this.sortOrder, required this.name, required this.price, this.quantity = 0});

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      name: json['name'],
      price: json['price'],
      sortOrder: json['sortOrder'],
      quantity: json['quantity'] ?? 0,
    );
  }

  @override
  List<Object> get props => [name, price, quantity];

  Size copyWith({
    String? name,
    double? price,
    int? quantity,
    int? sortOrder
  }) {
    return Size(
      name: name ?? this.name,
      price: price ?? this.price,
      sortOrder: sortOrder ?? this.sortOrder,
      quantity: quantity ?? this.quantity,
    );
  }
}
