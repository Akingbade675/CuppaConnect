import 'package:coffee_shop_app/src/constants/coffees_data.dart';

class CoffeeBean extends Coffee {
  CoffeeBean({
    required String id,
    required String name,
    required String type,
    required String squareImage,
    required String portraitImage,
    required Map<String, double> prices,
    required String description,
  }) : super(
          id: id,
          name: name,
          type: type,
          squareImage: squareImage,
          portraitImage: portraitImage,
          prices: prices,
          description: description,
        );

  factory CoffeeBean.fromMap(Map<String, dynamic> map) {
    return CoffeeBean(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      squareImage: map['squareImage'],
      portraitImage: map['portraitImage'],
      prices: Map<String, double>.from(map['prices']),
      description: map['description'],
    );
  }

  static List<CoffeeBean> getCoffeeBeans() {
    return CoffeeBeansData.coffeeBeans
        .map((coffeeBeanMap) => CoffeeBean.fromMap(coffeeBeanMap))
        .toList();
  }

  static CoffeeBean getCoffeeBean({required String id}) {
    return getCoffeeBeans().firstWhere((coffeeBean) => coffeeBean.id == id);
  }
}

class CoffeeBeansData {
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
