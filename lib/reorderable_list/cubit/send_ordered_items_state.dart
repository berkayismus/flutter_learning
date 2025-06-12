part of 'send_ordered_items_cubit.dart';

sealed class SendOrderedItemsState extends Equatable {
  const SendOrderedItemsState();

  @override
  List<Object> get props => [];
}

final class SendOrderedItemsInitial extends SendOrderedItemsState {}

final class SendOrderedItemsLoading extends SendOrderedItemsState {
  final int oldIndex;
  final int newIndex;
  const SendOrderedItemsLoading({
    required this.oldIndex,
    required this.newIndex,
  });

  @override
  List<Object> get props => [
        oldIndex,
        newIndex,
      ];
}

final class SendOrderedItemsLoaded extends SendOrderedItemsState {}

final class SendOrderedItemsFailure extends SendOrderedItemsState {
  final int oldIndex;
  final int newIndex;

  const SendOrderedItemsFailure({
    required this.oldIndex,
    required this.newIndex,
  });

  @override
  List<Object> get props => [
        oldIndex,
        newIndex,
      ];
}
