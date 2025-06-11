import 'dart:math';

import 'package:flutter_learning/favorite_menu/menu_item_model.dart';

abstract class IMenuRepository {
  Future<void> favorite(MenuItemModel item);
}

class MenuRepository implements IMenuRepository {
  @override
  Future<void> favorite(MenuItemModel item) async {
    final randBool = Random().nextBool();
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 1));
    // Fail after one second

    if (randBool) {
      return; // Simulate success
    }
    throw Exception('Failed to favorite');
  }
}
