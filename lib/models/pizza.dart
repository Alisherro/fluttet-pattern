
abstract class Pizza {
  late String description;

  String getDescription();

  double getPrice();
}

class PizzaBase extends Pizza {
  PizzaBase(String description) {
    this.description = description;
  }

  @override
  String getDescription() {
    return description;
  }

  @override
  double getPrice() {
    return 3.0;
  }
}

abstract class PizzaDecorator extends Pizza {

  final Pizza pizza;

  PizzaDecorator(this.pizza);

  @override
  String getDescription() {
    return pizza.getDescription();
  }

  @override
  double getPrice() {
    return pizza.getPrice();
  }
}

class Basil extends PizzaDecorator {

  @override
  String getDescription() {
    return '${pizza.getDescription()}\n-$description';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 0.2;
  }

  Basil._(super.pizza){
    description='Basil';
  }

  static  Basil instance(Pizza pizzza) => Basil._(pizzza);
}


class Mozzarella extends PizzaDecorator {
  Mozzarella(super.pizza) {
    description = 'Mozzarella';
  }

  @override
  String getDescription() {
    return '${pizza.getDescription()}\n-$description';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 0.5;
  }
}

class OliveOil extends PizzaDecorator {
  OliveOil(super.pizza) {
    description = 'Olive Oil';
  }

  @override
  String getDescription() {
    return '${pizza.getDescription()}\n-$description';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 0.1;
  }
}

class Oregano extends PizzaDecorator {
  Oregano(super.pizza) {
    description = 'Oregano';
  }

  @override
  String getDescription() {
    return '${pizza.getDescription()}\n-$description';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 0.2;
  }
}

class Pecorino extends PizzaDecorator {
  Pecorino(super.pizza) {
    description = 'Pecorino';
  }

  @override
  String getDescription() {
    return '${pizza.getDescription()}\n-$description';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 0.7;
  }
}

class Pepperoni extends PizzaDecorator {
  Pepperoni(super.pizza) {
    description = 'Pepperoni';
  }

  @override
  String getDescription() {
    return '${pizza.getDescription()}\n-$description';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 1.5;
  }
}

class Sauce extends PizzaDecorator {
  Sauce(super.pizza) {
    description = 'Sauce';
  }

  String getDescription() {
    return '${pizza.getDescription()}\n-$description';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 0.3;
  }
}

class PizzaToppingData {
  final String label;
  bool selected = false;

  PizzaToppingData(this.label);

  void setSelected(bool value) {
    selected = value;
  }
}

class PizzaMenu {
  final Map<int, PizzaToppingData> _pizzaToppingsDataMap = {
    1: PizzaToppingData('Basil'),
    2: PizzaToppingData('Mozzarella'),
    3: PizzaToppingData('Olive Oil'),
    4: PizzaToppingData('Oregano'),
    5: PizzaToppingData('Pecorino'),
    6: PizzaToppingData('Pepperoni'),
    7: PizzaToppingData('Sauce'),
  };

  Map<int, PizzaToppingData> getPizzaToppingDataMap() => _pizzaToppingsDataMap;

  Pizza getPizza(int index, Map<int, PizzaToppingData> pizzaTopingDataMap) {
    switch (index) {
      case 0:
        return _getMargherita();
      case 1:
        return _getPepperoni();
      case 2:
        return _getCustom(pizzaTopingDataMap);
    }
    throw Exception('index doesnt exist');
  }

  Pizza _getMargherita() {
    Pizza pizza = PizzaBase('Margherita');
    pizza = Sauce(pizza);
    pizza = Mozzarella(pizza);
    pizza = Basil.instance(pizza);
    pizza = Oregano(pizza);
    pizza = Pecorino(pizza);
    pizza = OliveOil(pizza);
    return pizza;
  }

  Pizza _getPepperoni() {
    Pizza pizza = PizzaBase('Pepperoni');
    pizza = Sauce(pizza);
    pizza = Mozzarella(pizza);
    pizza = Pepperoni(pizza);
    pizza = Oregano(pizza);
    return pizza;
  }

  Pizza _getCustom(Map<int, PizzaToppingData> pizzaToppingsDataMap) {
    Pizza pizza = PizzaBase('Custom Pizza');
    if (pizzaToppingsDataMap[1]!.selected) {
      pizza = Basil.instance(pizza);
    }
    if (pizzaToppingsDataMap[2]!.selected) {
      pizza = Mozzarella(pizza);
    }
    if (pizzaToppingsDataMap[3]!.selected) {
      pizza = OliveOil(pizza);
    }
    if (pizzaToppingsDataMap[4]!.selected) {
      pizza = Oregano(pizza);
    }
    if (pizzaToppingsDataMap[5]!.selected) {
      pizza = Pecorino(pizza);
    }
    if (pizzaToppingsDataMap[6]!.selected) {
      pizza = Pepperoni(pizza);
    }
    if (pizzaToppingsDataMap[7]!.selected) {
      pizza = Sauce(pizza);
    }
    return pizza;
  }
}
