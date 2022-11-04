import 'dart:math';

import 'package:flutter/material.dart';

import '../models/pizza.dart';

class PizzaWidget extends StatefulWidget {
  const PizzaWidget();

  @override
  _PizzaWidgetState createState() => _PizzaWidgetState();
}

class _PizzaWidgetState extends State<PizzaWidget> {

  static const _labels = ['Pizza Margherita', 'Pizza Pepperoni', 'Custom'];
  final PizzaMenu pizzaMenu = PizzaMenu();

  late final Map<int, PizzaToppingData> _pizzaToppingsDataMap;
  late Pizza _pizza;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pizzaToppingsDataMap = pizzaMenu.getPizzaToppingDataMap();
    _pizza = pizzaMenu.getPizza(0, _pizzaToppingsDataMap);
  }

  void _onSelectedIndexChanged(int? index) {
    _setSelectedIndex(index!);
    _setSelectedPizza(index);
  }

  void _setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCustomPizzaChipSelected(int index, bool? selected) {
    _setChipSelected(index, selected!);
    _setSelectedPizza(_selectedIndex);
  }

  void _setChipSelected(int index, bool selected) {
    setState(() {
      _pizzaToppingsDataMap[index]!.setSelected(selected);
    });
  }

  void _setSelectedPizza(int index) {
    setState(() {
      _pizza = pizzaMenu.getPizza(index, _pizzaToppingsDataMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Pizza')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Select your pizza:',
                style: Theme.of(context).textTheme.headline6,
              ),
              Column(
                children: [
                  for (var i = 0; i < _labels.length; i++)
                    RadioListTile(
                      title: Text(_labels[i]),
                      value: i,
                      groupValue: _selectedIndex,
                      selected: i == _selectedIndex,
                      activeColor: Colors.black,
                      onChanged: _onSelectedIndexChanged,
                    ),
                ],
              ),
              if (_selectedIndex == 2)
                CustomPizzaSelection(
                  pizzaToppingsDataMap: _pizzaToppingsDataMap,
                  onSelected: _onCustomPizzaChipSelected,
                ),
              PizzaInformation(
                pizza: _pizza,
              ),
            ],
          ),
        ));
  }
}

class CustomPizzaSelection extends StatelessWidget {
  final Map<int, PizzaToppingData> pizzaToppingsDataMap;
  final Function(int, bool?) onSelected;

  const CustomPizzaSelection({
    required this.pizzaToppingsDataMap,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      children: [
        for (var i = 0; i < pizzaToppingsDataMap.length; i++)
          i == 0
              ? ChoiceChip(
                  label: const Text(
                    'Pizza Base',
                    style: TextStyle(color: Colors.white),
                  ),
                  selected: true,
                  selectedColor: Colors.black,
                  onSelected: (_) {},
                )
              : ChoiceChip(
                  label: Text(
                    pizzaToppingsDataMap[i]!.label,
                    style: TextStyle(
                      color: pizzaToppingsDataMap[i]!.selected
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  selected: pizzaToppingsDataMap[i]!.selected,
                  selectedColor: Colors.black,
                  onSelected: (bool? selected) => onSelected(i, selected),
                ),
      ],
    );
  }
}

class PizzaInformation extends StatelessWidget {
  final Pizza pizza;

  const PizzaInformation({
    required this.pizza,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Pizza details:',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 10),
        Text(
          pizza.getDescription(),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 10),
        Text('Price: \$${pizza.getPrice().toStringAsFixed(2)}'),
      ],
    );
  }
}

