// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cart_repository/cart_repository.dart';
import 'package:equatable/equatable.dart';

class CoffeeItem extends Equatable {
  final String id;
  final String name;
  final String type;
  final bool isFavorite;
  final bool isBean;
  final String squareImage;
  final String portraitImage;
  final List<Size> sizes;
  final String description;

  const CoffeeItem({
    required this.id,
    required this.name,
    required this.type,
    required this.squareImage,
    required this.portraitImage,
    this.sizes = const [],
    this.isFavorite = false,
    this.isBean = false,
    required this.description,
  });

  factory CoffeeItem.fromJson(Map<String, dynamic> json) {
    List<Size> getSizes(Map<String, double> prices) {
      List<Size> sizes = [];

      int index = 0;
      prices.forEach((name, price) {
        sizes.add(Size(sortOrder: index++, name: name, price: price));
      });

      return sizes;
    }

    return CoffeeItem(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        squareImage: json['squareImage'],
        portraitImage: json['portraitImage'],
        description: json['description'],
        sizes: getSizes(json['prices'] as Map<String, double>));
  }

  @override
  List<Object> get props => [
        id,
        name,
        type,
        squareImage,
        portraitImage,
        sizes,
        description,
      ];

  CoffeeItem copyWith({
    String? id,
    String? name,
    String? type,
    String? squareImage,
    String? portraitImage,
    List<Size>? sizes,
    bool? isFavorite,
    bool? isBean,
    String? description,
  }) {
    return CoffeeItem(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      squareImage: squareImage ?? this.squareImage,
      portraitImage: portraitImage ?? this.portraitImage,
      sizes: sizes ?? this.sizes,
      isFavorite: isFavorite ?? this.isFavorite,
      isBean: isBean ?? this.isBean,
      description: description ?? this.description,
    );
  }
}

class CoffeeData {
  static const coffeeTypes = [
    'Cappuccino',
    'Americano',
    'Espresso',
    'Macchiato',
    // 'Black Coffee',
    // 'Latte',
  ];

  static Map<String, List<CoffeeItem>> getCoffeeItems() {
    final Map<String, List<CoffeeItem>> coffeeItems = {};
    coffees.forEach((key, value) {
      coffeeItems[key] =
          value.map((coffee) => CoffeeItem.fromJson(coffee)).toList();
    });
    return coffeeItems;
  }

  static CoffeeItem getCoffeeItem({required String id, String name = ''}) {
    final coffeeItems = getCoffeeItems();
    return coffeeItems.values.expand((element) => element).firstWhere(
          (element) => element.id == id,
          orElse: () => const CoffeeItem(
            id: 'not_found',
            name: 'Not Found',
            type: 'Not Found',
            squareImage: '',
            portraitImage: '',
            sizes: [],
            description: 'The coffee item you are looking for was not found.',
          ),
        );
  }

  static const coffees = {
    'Cappuccino': [
      {
        'id': 'cappuccino_1',
        'name': 'Cappuccino',
        'type': 'With Steamed Milk',
        'squareImage':
            'assets/coffee_assets/cappuccino/square/cappuccino_pic_1_square.png',
        'portraitImage':
            'assets/coffee_assets/cappuccino/portrait/cappuccino_pic_1_portrait.png',
        'prices': {
          'Small': 3.99,
          'Medium': 4.99,
          'Large': 5.99,
        },
        'description':
            'Cappuccino is a latte made with more foam than steamed milk, often with a sprinkle of cocoa powder or cinnamon on top.'
      },
      {
        'id': 'cappuccino_2',
        'name': 'Cappuccino',
        'type': 'With Foam',
        'squareImage':
            'assets/coffee_assets/cappuccino/square/cappuccino_pic_2_square.png',
        'portraitImage':
            'assets/coffee_assets/cappuccino/portrait/cappuccino_pic_2_portrait.png',
        'prices': {
          'Small': 4.49,
          'Medium': 5.49,
          'Large': 6.49,
        },
        'description':
            'Cappuccino with Foam is a variation of the classic cappuccino, where the milk foam layer is thicker, giving it a creamier texture and a stronger foam flavor.',
      },
      {
        'id': 'cappuccino_3',
        'name': 'Cappuccino',
        'type': 'With Caramel',
        'squareImage':
            'assets/coffee_assets/cappuccino/square/cappuccino_pic_3_square.png',
        'portraitImage':
            'assets/coffee_assets/cappuccino/portrait/cappuccino_pic_3_portrait.png',
        'prices': {
          'Small': 4.99,
          'Medium': 5.99,
          'Large': 6.99,
        },
        'description':
            'This caramel cappuccino is a sweet treat that can be enjoyed any time of day and is perfect for those who love the taste of caramel in their coffee.',
      },
    ],
    'Americano': [
      {
        'id': 'americano_1',
        'name': 'Americano',
        'type': 'With Hot Water',
        'squareImage':
            'assets/coffee_assets/americano/square/americano_pic_1_square.png',
        'portraitImage':
            'assets/coffee_assets/americano/portrait/americano_pic_1_portrait.png',
        'prices': {
          'Small': 2.99,
          'Medium': 3.99,
          'Large': 4.99,
        },
        'description':
            'Americano is a coffee drink prepared by diluting an espresso with hot water, giving it a similar strength to, but different flavor from traditionally brewed coffee.',
      },
      {
        'id': 'americano_2',
        'name': 'Americano',
        'type': 'With Cream',
        'squareImage':
            'assets/coffee_assets/americano/square/americano_pic_2_square.png',
        'portraitImage':
            'assets/coffee_assets/americano/portrait/americano_pic_2_portrait.png',
        'prices': {
          'Small': 3.49,
          'Medium': 4.49,
          'Large': 5.49,
        },
        'description':
            'Americano with Cream is a variation of the classic Americano, with the addition of cream for a smoother texture and a richer flavor.',
      },
      {
        'id': 'americano_3',
        'name': 'Americano',
        'type': 'With Syrup',
        'squareImage':
            'assets/coffee_assets/americano/square/americano_pic_3_square.png',
        'portraitImage':
            'assets/coffee_assets/americano/portrait/americano_pic_3_portrait.png',
        'prices': {
          'Small': 3.49,
          'Medium': 4.49,
          'Large': 5.49,
        },
        'description':
            'Americano with Syrup is another variation of the classic Americano, with the addition of flavored syrup for a customized taste experience.',
      },
    ],
    'Espresso': [
      {
        'id': 'espresso_1',
        'name': 'Espresso',
        'type': 'Single Shot',
        'squareImage':
            'assets/coffee_assets/espresso/square/espresso_pic_1_square.png',
        'portraitImage':
            'assets/coffee_assets/espresso/portrait/espresso_pic_1_portrait.png',
        'prices': {
          'Single Shot': 1.99,
        },
        'description':
            'Single Shot Espresso is a concentrated form of coffee served in a small, strong shot. It is made by forcing hot water through finely-ground coffee beans.',
      },
      {
        'id': 'espresso_2',
        'name': 'Espresso',
        'type': 'Double Shot',
        'squareImage':
            'assets/coffee_assets/espresso/square/espresso_pic_2_square.png',
        'portraitImage':
            'assets/coffee_assets/espresso/portrait/espresso_pic_2_portrait.png',
        'prices': {
          'Double Shot': 2.99,
        },
        'description':
            'Double Shot Espresso is a larger serving of concentrated coffee, made by extracting twice the amount of coffee grounds as a single shot.',
      },
      {
        'id': 'espresso_3',
        'name': 'Espresso',
        'type': 'With Sugar',
        'squareImage':
            'assets/coffee_assets/espresso/square/espresso_pic_3_square.png',
        'portraitImage':
            'assets/coffee_assets/espresso/portrait/espresso_pic_3_portrait.png',
        'prices': {
          'Single Shot': 1.99,
          'Double Shot': 2.99,
        },
        'description':
            'Espresso with Sugar is a classic way to enjoy espresso, with the addition of sugar to balance out the intense bitterness of the coffee.',
      },
    ],
    'Macchiato': [
      {
        'id': 'macchiato_1',
        'name': 'Macchiato',
        'type': 'With Caramel Drizzle',
        'squareImage':
            'assets/coffee_assets/macchiato/square/macchiato_pic_1_square.png',
        'portraitImage':
            'assets/coffee_assets/macchiato/portrait/macchiato_pic_1_portrait.png',
        'prices': {
          'Small': 2.49,
          'Medium': 3.49,
        },
        'description':
            'Macchiato with Caramel Drizzle is a coffee drink made with a shot of espresso and a small amount of milk, usually foamed. It is then topped with caramel syrup drizzle for a sweet and indulgent flavor.',
      },
      {
        'id': 'macchiato_2',
        'name': 'Macchiato',
        'type': 'With Vanilla Extract',
        'squareImage':
            'assets/coffee_assets/macchiato/square/macchiato_pic_2_square.png',
        'portraitImage':
            'assets/coffee_assets/macchiato/portrait/macchiato_pic_2_portrait.png',
        'prices': {
          'Small': 2.99,
          'Medium': 3.99,
        },
        'description':
            'Macchiato with Vanilla Extract is a variation of the classic macchiato, with the addition of vanilla extract for a subtle and aromatic twist to the flavor profile.',
      },
      {
        'id': 'macchiato_3',
        'name': 'Macchiato',
        'type': 'With Hazelnut Flavor',
        'squareImage':
            'assets/coffee_assets/macchiato/square/macchiato_pic_3_square.png',
        'portraitImage':
            'assets/coffee_assets/macchiato/portrait/macchiato_pic_3_portrait.png',
        'prices': {
          'Small': 2.99,
          'Medium': 3.99,
        },
        'description':
            'Macchiato with Hazelnut Flavor is another variation of the classic macchiato, with the addition of hazelnut syrup for a nutty and aromatic taste experience.',
      },
    ],
    'Black Coffee': [
      {
        'id': 'black_coffee_1',
        'name': 'Black Coffee',
        'type': 'Classic Black',
        'squareImage':
            'assets/coffee_assets/black_coffee/square/black_coffee_pic_1_square.png',
        'portraitImage':
            'assets/coffee_assets/black_coffee/portrait/black_coffee_pic_1_portrait.png',
        'prices': {
          'Small': 2.49,
          'Medium': 3.49,
          'Large': 4.49,
        },
        'description':
            'Black coffee, also known as drip coffee or brewed coffee, is made by pouring hot water over ground coffee beans, resulting in a strong and bold flavor without any added milk or sugar.',
      },
      {
        'id': 'black_coffee_2',
        'name': 'Black Coffee',
        'type': 'Dark Roast',
        'squareImage':
            'assets/coffee_assets/black_coffee/square/black_coffee_pic_2_square.png',
        'portraitImage':
            'assets/coffee_assets/black_coffee/portrait/black_coffee_pic_2_portrait.png',
        'prices': {
          'Small': 2.99,
          'Medium': 3.99,
          'Large': 4.99,
        },
        'description':
            'Dark roast coffee has a bold and intense flavor profile with a rich, smoky taste and sometimes a slightly sweet aftertaste. It is roasted longer than other coffee beans, resulting in a darker color and oilier surface.',
      },
      {
        'id': 'black_coffee_3',
        'name': 'Black Coffee',
        'type': 'Light Roast',
        'squareImage':
            'assets/coffee_assets/black_coffee/square/black_coffee_pic_3_square.png',
        'portraitImage':
            'assets/coffee_assets/black_coffee/portrait/black_coffee_pic_3_portrait.png',
        'prices': {
          'Small': 2.99,
          'Medium': 3.99,
          'Large': 4.99,
        },
        'description':
            'Light roast coffee has a milder flavor profile with a brighter acidity and more pronounced fruity or floral notes. It is roasted for a shorter duration than dark roast coffee, preserving more of the bean’s original flavors.',
      },
    ],
    'Latte': [
      {
        'id': 'latte_1',
        'name': 'Latte',
        'type': 'Classic Latte',
        'squareImage':
            'assets/coffee_assets/latte/square/latte_pic_1_square.png',
        'portraitImage':
            'assets/coffee_assets/latte/portrait/latte_pic_1_portrait.png',
        'prices': {
          'Small': 3.99,
          'Medium': 4.99,
          'Large': 5.99,
        },
        'description':
            'Latte is a coffee drink made with espresso and steamed milk, often topped with a small amount of milk foam. It has a creamy texture and a mild, slightly sweet flavor.',
      },
      {
        'id': 'latte_2',
        'name': 'Latte',
        'type': 'Vanilla Latte',
        'squareImage':
            'assets/coffee_assets/latte/square/latte_pic_2_square.png',
        'portraitImage':
            'assets/coffee_assets/latte/portrait/latte_pic_2_portrait.png',
        'prices': {
          'Small': 4.49,
          'Medium': 5.49,
          'Large': 6.49,
        },
        'description':
            'Vanilla latte is a variation of the classic latte, with the addition of vanilla syrup for a sweet and aromatic flavor profile that complements the espresso and steamed milk.',
      },
      {
        'id': 'latte_3',
        'name': 'Latte',
        'type': 'Caramel Latte',
        'squareImage':
            'assets/coffee_assets/latte/square/latte_pic_3_square.png',
        'portraitImage':
            'assets/coffee_assets/latte/portrait/latte_pic_3_portrait.png',
        'prices': {
          'Small': 4.49,
          'Medium': 5.49,
          'Large': 6.49,
        },
        'description':
            'Caramel latte is another variation of the classic latte, with the addition of caramel syrup for a rich and indulgent flavor that adds a hint of sweetness to the espresso and steamed milk.',
      },
    ],
  };
}

class CoffeeBeansData {
  static getCoffeeBeans() {
    return coffeeBeans
        .map((coffee) => CoffeeItem.fromJson(coffee).copyWith(isBean: true))
        .toList();
  }

  static CoffeeItem getCoffeeBean({required String id}) {
    return getCoffeeBeans().firstWhere(
      (element) => element.id == id,
      orElse: () => const CoffeeItem(
        id: 'not_found',
        name: 'Not Found',
        type: 'Not Found',
        squareImage: '',
        portraitImage: '',
        sizes: [],
        description: 'The coffee item you are looking for was not found.',
      ),
    );
  }

  static const coffeeBeans = [
    {
      'id': 'arabica_coffee_beans',
      'name': 'Arabica Coffee Beans',
      'type': 'Classic Arabica',
      'squareImage':
          'assets/coffee_assets/arabica_coffee_beans/arabica_coffee_beans_square.png',
      'portraitImage':
          'assets/coffee_assets/arabica_coffee_beans/arabica_coffee_beans_portrait.png',
      'prices': {
        '250g': 8.99,
        '500g': 16.99,
        '1000g': 29.99,
      },
      'description':
          'Arabica coffee beans are known for their smooth, mild flavor profile with hints of sweetness and acidity. They are often favored for their pleasant aroma and low caffeine content.',
    },
    {
      'id': 'excelsa_coffee_beans',
      'name': 'Excelsa Coffee Beans',
      'type': 'Classic Excelsa',
      'squareImage':
          'assets/coffee_assets/excelsa_coffee_beans/excelsa_coffee_beans_square.png',
      'portraitImage':
          'assets/coffee_assets/excelsa_coffee_beans/excelsa_coffee_beans_portrait.png',
      'prices': {
        '250g': 7.99,
        '500g': 14.99,
        '1000g': 26.99,
      },
      'description':
          'Excelsa coffee beans, also known as Coffea excelsa or "excelsa liberica," are characterized by their unique and exotic flavor profile with fruity and spicy notes. They add complexity to coffee blends.',
    },
    {
      'id': 'liberica_coffee_beans',
      'name': 'Liberica Coffee Beans',
      'type': 'Classic Liberica',
      'squareImage':
          'assets/coffee_assets/liberica_coffee_beans/liberica_coffee_beans_square.png',
      'portraitImage':
          'assets/coffee_assets/liberica_coffee_beans/liberica_coffee_beans_portrait.png',
      'prices': {
        '250g': 6.99,
        '500g': 12.99,
        '1000g': 22.99,
      },
      'description':
          'Liberica coffee beans, also known as Coffea liberica, have a distinctive flavor profile with bold, woody, and smoky characteristics. They are larger in size compared to other coffee bean varieties.',
    },
    {
      'id': 'robusta_coffee_beans',
      'name': 'Robusta Coffee Beans',
      'type': 'Classic Robusta',
      'squareImage':
          'assets/coffee_assets/robusta_coffee_beans/robusta_coffee_beans_square.png',
      'portraitImage':
          'assets/coffee_assets/robusta_coffee_beans/robusta_coffee_beans_portrait.png',
      'prices': {
        '250g': 5.99,
        '500g': 10.99,
        '1000g': 19.99,
      },
      'description':
          'Robusta coffee beans, also known as Coffea canephora, are valued for their strong and bold flavor profile with higher caffeine content and a slightly bitter taste. They are often used in espresso blends.',
    },
  ];
}
