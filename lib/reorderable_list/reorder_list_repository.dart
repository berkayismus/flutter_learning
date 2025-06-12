import 'dart:math';

import 'package:flutter_learning/reorderable_list/food_model.dart';

abstract class IReorderListRepository {
  Future<List<Food>> getItems();
  Future<void> sendOrderedItems(List<Food> items);
}

class ReorderListRepository implements IReorderListRepository {
  @override
  Future<List<Food>> getItems() async {
    // Simulate a network call or database query
    await Future.delayed(const Duration(seconds: 1));

    return [
      const Food(id: "1", title: 'Pizza'),
      const Food(id: "2", title: 'Burger'),
      const Food(id: "3", title: 'Pasta'),
      const Food(id: "4", title: 'Sushi'),
      const Food(id: "5", title: 'Salad'),
      const Food(id: "6", title: 'Tacos'),
      const Food(id: "7", title: 'Steak'),
      const Food(id: "8", title: 'Ice Cream'),
    ];
  }

  @override
  Future<void> sendOrderedItems(List<Food> items) async {
    final randBool = Random().nextBool();

    await Future.delayed(const Duration(seconds: 1));

    if (randBool) {
      return;
    }

    throw Exception('Failed to send ordered items');
  }
}
