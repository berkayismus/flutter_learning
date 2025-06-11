import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_learning/favorite_menu/menu_item_model.dart';
import 'package:flutter_learning/favorite_menu/menu_repository.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this._menuRepository) : super(MenuState.initial());

  final IMenuRepository _menuRepository;

  void favorite(bool isFavorite, MenuItemModel item) {
    final updatedItems = state.items.map((currentItem) {
      if (currentItem.title == item.title) {
        return currentItem.copyWith(isFavorite: isFavorite);
      }
      return currentItem;
    }).toList();

    // Favorileri üste sırala
    updatedItems.sort((a, b) => b.isFavorite ? 1 : (a.isFavorite ? -1 : 0));

    emit(MenuState(items: updatedItems));
  }

/*   Future<void> setFavorite(MenuItemModel item) async {
    final updatedItems = state.items.map((currentItem) {
      if (currentItem.title == item.title) {
        return currentItem.copyWith(isFavorite: !currentItem.isFavorite);
      }
      return currentItem;
    }).toList();

    // Favorileri üste sırala
    updatedItems.sort((a, b) => b.isFavorite ? 1 : (a.isFavorite ? -1 : 0));

    emit(MenuState(items: updatedItems));

    try {
      await _menuRepository.favorite(item);
    } catch (e) {
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
  } */
}
