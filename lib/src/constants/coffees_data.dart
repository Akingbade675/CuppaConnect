class Coffee {
  final String id;
  final String name;
  final String type;
  final String squareImage;
  final String portraitImage;
  final Map<String, double> prices;
  final String description;

  Coffee({
    required this.id,
    required this.name,
    required this.type,
    required this.squareImage,
    required this.portraitImage,
    required this.prices,
    required this.description,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      squareImage: json['squareImage'],
      portraitImage: json['portraitImage'],
      prices: Map<String, double>.from(json['prices']),
      description: json['description'],
    );
  }

  static List<Coffee> getCoffees(String coffeeType) {
    return CoffeeData.coffees[coffeeType]!
        .map((json) => Coffee.fromJson(json))
        .toList();
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
