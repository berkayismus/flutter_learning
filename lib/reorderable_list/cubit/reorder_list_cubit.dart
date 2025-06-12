import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_learning/reorderable_list/food_model.dart';
import 'package:flutter_learning/reorderable_list/reorder_list_repository.dart';
import 'package:flutter_learning/reorderable_list/reorder_list_page.dart';

part 'reorder_list_state.dart';

class ReorderListCubit extends Cubit<ReorderListState> {
  ReorderListCubit(this._reorderListRepository)
      : super(ReorderListState.initial());

  final IReorderListRepository _reorderListRepository;

  Future<void> getItems() async {
    try {
      emit(state.copyWith(isLoading: true));

      final items = await _reorderListRepository.getItems();
      emit(state.copyWith(isLoading: false, items: items));
    } catch (e) {}
  }

  void reOrder({required int oldIndex, required int newIndex}) {
    final nItems = List.from(state.items);
    final food = nItems.removeAt(oldIndex);
    nItems.insert(newIndex, food);

    emit(state.copyWith(items: List.from(nItems)));
  }
}
