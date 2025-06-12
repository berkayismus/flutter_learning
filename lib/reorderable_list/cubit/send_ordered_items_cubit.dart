import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_learning/reorderable_list/food_model.dart';
import 'package:flutter_learning/reorderable_list/reorder_list_repository.dart';

part 'send_ordered_items_state.dart';

class SendOrderedItemsCubit extends Cubit<SendOrderedItemsState> {
  SendOrderedItemsCubit(this._reorderListRepository)
      : super(SendOrderedItemsInitial());

  final IReorderListRepository _reorderListRepository;

  Future<void> sendOrderedItems(
      {required List<Food> items,
      required int oldIndex,
      required int newIndex}) async {
    try {
      emit(SendOrderedItemsLoading(oldIndex: oldIndex, newIndex: newIndex));

      await _reorderListRepository.sendOrderedItems(items);

      emit(SendOrderedItemsLoaded());
    } catch (e) {
      emit(SendOrderedItemsFailure(newIndex: newIndex, oldIndex: oldIndex));
    }
  }
}
