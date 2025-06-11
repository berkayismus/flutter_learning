import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_learning/favorite_menu/menu_item_model.dart';
import 'package:flutter_learning/favorite_menu/menu_repository.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this._menuRepository) : super(FavoriteInitial());

  final IMenuRepository _menuRepository;

  Future<void> favorite(MenuItemModel item) async {
    try {
      emit(FavoriteLoading(item: item));

      await _menuRepository.favorite(item);

      emit(FavoriteLoaded());
    } catch (e) {
      emit(FavoriteFailure(item: item));
    }
  }
}
