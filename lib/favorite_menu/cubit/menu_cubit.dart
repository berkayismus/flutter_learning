import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/favorite_menu/menu_item_model.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuState.initial());

  void favorite(MenuItemModel item) {
    final updatedItems = state.items.map((currentItem) {
      if (currentItem.title == item.title) {
        return currentItem.copyWith(isFavorite: !currentItem.isFavorite);
      }
      return currentItem;
    }).toList();

    // Favorileri üste sırala
    updatedItems.sort((a, b) => b.isFavorite ? 1 : (a.isFavorite ? -1 : 0));

    emit(MenuState(items: updatedItems));
  }
}
